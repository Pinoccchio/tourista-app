import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../routes/app_routes.dart';
import 'Database_Helper/FirestoreDatabaseHelper.dart';
import 'Database_Helper/SQLiteDatabaseHelper.dart';
import 'Database_Helper/static_users.dart'; // Ensure this file has your `User` class definition.

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final int splashDuration = 3; // Duration in seconds to display the splash screen

  @override
  void initState() {
    super.initState();
    _startSplashScreenTimer();
  }

  void _startSplashScreenTimer() async {
    await Future.delayed(Duration(seconds: splashDuration)); // Minimum splash screen duration
    _checkInternetAndProceed();
  }

  // Check if the app is being launched for the first time and proceed accordingly
  void _checkInternetAndProceed() async {
    bool firstLaunch = await _isFirstLaunch();

    if (firstLaunch) {
      _ensureInternetConnection();
    } else {
      // Not first launch, proceed with local data
      _loadLocalDataAndProceed();
    }
  }

  // Ensure that the internet connection is available
  void _ensureInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetDialog();
    } else {
      await _uploadStaticUsers(); // Upload static users if needed
      _fetchAndStoreUserData();
    }
  }

  // Show a dialog if there is no internet connection on the first launch
  void _showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("No Internet Connection"),
          content: Text("Please enable your internet connection to proceed."),
          actions: [
            TextButton(
              child: Text("Retry"),
              onPressed: () {
                Navigator.of(context).pop();
                _ensureInternetConnection();
              },
            ),
            TextButton(
              child: Text("Exit"),
              onPressed: () {
                _exitApp();
              },
            ),
          ],
        );
      },
    );
  }

  // Exit the app
  void _exitApp() {
    Navigator.of(context).pop(); // Close the dialog
    Future.delayed(Duration(milliseconds: 500), () {
      SystemNavigator.pop(); // Exit the app
    });
  }

  // Upload static users to Firestore
  Future<void> _uploadStaticUsers() async {
    try {
      await FirestoreDatabaseHelper.uploadStaticUsers();  // Call the method to upload static users
    } catch (e) {
      Fluttertoast.showToast(
        //msg: "Error uploading static users: $e",
        msg: "Error uploading static users: No internet connection.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // Fetch users from Firestore and store them locally
  Future<void> _fetchAndStoreUserData() async {
    try {
      var users = await fetchUsersFromFirestore();
      await storeUsersInSQLite(users); // Store in SQLite
      await _setFirstLaunchComplete();
      _navigateToNextScreen();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error fetching or storing users: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      _ensureInternetConnection(); // Retry fetching data
    }
  }

  // Load user data from local storage and proceed
  Future<void> _loadLocalDataAndProceed() async {
    var users = await loadUsersFromSQLite(); // Load from SQLite

    if (users.isEmpty) {
      Fluttertoast.showToast(
        msg: "No user data available offline. Please connect to the internet.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      _ensureInternetConnection(); // Prompt for internet connection again
    } else {
      // Proceed to the next screen with the loaded users
      _navigateToNextScreen();
    }
  }

  // Sync local data with Firestore if internet connection is available
  Future<void> _syncDataWithFirestore() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      await syncLocalDataToFirestore();
    }
  }

  // Navigate to the next screen
  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.signInFilled);
  }

  // Check if this is the first launch of the app
  Future<bool> _isFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_launch') ?? true;
  }

  // Set the first launch flag to false after the first successful launch
  Future<void> _setFirstLaunchComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_launch', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF000000),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centered logo
            Center(
              child: SizedBox(
                width: 213,
                height: 38.9,
                child: SvgPicture.asset(
                  'assets/vectors/group_33398_x2.svg',
                ),
              ),
            ),
            // Loading animation at the bottom
            Positioned(
              bottom: 30.0,
              child: SizedBox(
                width: 180,
                height: 180,
                child: Lottie.asset(
                  'assets/animated_icon/loading-animation.json',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fetch users from Firestore
  Future<List<User>> fetchUsersFromFirestore() async {
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await usersCollection.get();
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User.fromMap(data);
    }).toList();
  }

  // Store users in SQLite
  Future<void> storeUsersInSQLite(List<User> users) async {
    for (var user in users) {
      await SQLDatabaseHelper.instance.insertUser(user.toMap());
    }
  }

  // Load users from SQLite
  Future<List<User>> loadUsersFromSQLite() async {
    // Fetch users from SQLite
    List<User> users = await SQLDatabaseHelper.instance.getAllUsers();
    return users; // Return the list of User objects
  }

  // Sync local data with Firestore
  Future<void> syncLocalDataToFirestore() async {
    List<User> localUsers = await loadUsersFromSQLite();
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    for (var user in localUsers) {
      String userId = user.studentNumber; // Assuming studentNumber is the unique identifier
      await usersCollection.doc(userId).set(user.toMap(), SetOptions(merge: true));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Database_Helper/FirestoreHelper.dart';

class SignInFilled extends StatefulWidget {
  @override
  _SignInFilledState createState() => _SignInFilledState();
}

class _SignInFilledState extends State<SignInFilled> {
  final TextEditingController _studentNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<bool> _isConnectedToInternet() async {
    // Implement internet connectivity check
    // This can be done using the connectivity_plus package or another method
    return true; // For simplicity, assume always connected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo and Welcome Section
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    SizedBox(
                      width: 213,
                      height: 38.9,
                      child: SvgPicture.asset(
                        'assets/vectors/group_333981_x2.svg',
                      ),
                    ),
                    SizedBox(height: 20),
                    // Welcome text
                    Text(
                      'Welcome Students',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        height: 1.1,
                        color: Color(0xFF73CBE6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              // Instruction text
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.4),
                child: Text(
                  'Please enter your student number and password to Sign In',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Student Number field
              _buildInputField(
                  label: 'Student Number',
                  hintText: '21-17-043',
                  controller: _studentNumberController,
                  isPassword: false),
              // Password field
              _buildInputField(
                  label: 'Password',
                  hintText: '**********',
                  controller: _passwordController,
                  isPassword: true),
              SizedBox(height: 50),
              // Sign In Button
              ElevatedButton(
                onPressed: () async {
                  String studentNumber = _studentNumberController.text;
                  String password = _passwordController.text;

                  if (studentNumber.isEmpty || password.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Please enter student number and password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else {
                    if (await _isConnectedToInternet()) {
                      // Check Firestore for user
                      try {
                        var userDoc = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(studentNumber)
                            .get();

                        if (userDoc.exists) {
                          var user = userDoc.data()!;
                          await FirestoreHelper.instance.insertUser(user);
                          if (user['password'] == password) {
                            Fluttertoast.showToast(
                              msg: "Welcome, ${user['firstName']}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              '/home',
                              arguments: {
                                'firstName': user['firstName'],
                                'lastName': user['lastName'],
                                'studentNumber': user['studentNumber'],
                                'password': user['password'],
                              },
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Incorrect password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: "User not found",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: "Error: Please connect to the internet to set up your account. Once set up, you can use the app offline.",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    } else {
                      // Check local database for user
                      var user = await FirestoreHelper.instance.getUser(studentNumber);
                      if (user != null && user['password'] == password) {
                        Fluttertoast.showToast(
                          msg: "Welcome, ${user['firstName']}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          '/home',
                          arguments: {
                            'firstName': user['firstName'],
                            'lastName': user['lastName'],
                            'studentNumber': user['studentNumber'],
                            'password': user['password'],
                          },
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "Incorrect student number or password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  backgroundColor: Color(0xFF73CBE6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0.7, 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            obscureText: isPassword && !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white.withOpacity(0.5),
              ),
              suffixIcon: isPassword
                  ? IconButton(
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
                  : null,
              filled: true,
              fillColor: Colors.white.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

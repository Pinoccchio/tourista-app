import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/SignIn_Screen/sign_in_filled.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Notification_Handler/notification_handler.dart';

class SignUpFilled extends StatefulWidget {
  @override
  _SignUpFilledState createState() => _SignUpFilledState();
}

class _SignUpFilledState extends State<SignUpFilled> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  final NotificationHandler _notificationHandler = NotificationHandler();

  Future<bool> _isConnectedToInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> _saveUser(String fullName, String email, String password) async {
    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'fullName': fullName,
      'email': email, // Save email to Firestore
      'password': password, // Save password to Firestore (ensure this is secure)
    });
  }

  @override
  void initState() {
    super.initState();
    _notificationHandler.initializeNotifications();
    _notificationHandler.requestNotificationPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: const BoxDecoration(
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
                    const SizedBox(height: 50),
                    SizedBox(
                      width: 213,
                      height: 38.9,
                      child: Image.asset(
                        'assets/images/sample_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Create Your Account',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        height: 1.1,
                        color: const Color(0xFF73CBE6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Instruction text
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.4),
                child: Text(
                  'Please enter your details to Sign Up',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Full Name field
              _buildInputField(
                label: 'Full Name',
                hintText: 'Juan Dela Cruz',
                controller: _nameController,
                isPassword: false,
              ),
              // Email field
              _buildInputField(
                label: 'Email Address',
                hintText: 'juandela.cruz@example.com',
                controller: _emailController,
                isPassword: false,
              ),
              // Password field
              _buildInputField(
                label: 'Password',
                hintText: '**********',
                controller: _passwordController,
                isPassword: true,
              ),
              // Confirm Password field
              _buildInputField(
                label: 'Confirm Password',
                hintText: '**********',
                controller: _confirmPasswordController,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              // Sign Up Button
              ElevatedButton(
                onPressed: () async {
                  String fullName = _nameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String confirmPassword = _confirmPasswordController.text;

                  if (fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                    _showToast('Please fill in all fields', Colors.red);
                  } else if (password != confirmPassword) {
                    _showToast('Passwords do not match', Colors.red);
                  } else {
                    if (await _isConnectedToInternet()) {
                      try {
                        // Create user with Firebase Authentication
                        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // Save additional user information
                        await _saveUser(fullName, email, password);
                        _showToast("Account created successfully", Colors.green);

                        // Navigate to sign-in screen
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignInFilled()),
                        );
                      } on FirebaseAuthException catch (e) {
                        _showToast(e.message ?? 'Error occurred', Colors.red);
                      }
                    } else {
                      _showToast('No internet connection', Colors.red);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  backgroundColor: const Color(0xFF73CBE6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
      margin: const EdgeInsets.fromLTRB(0, 0, 0.7, 35),
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
          const SizedBox(height: 10),
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
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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

  void _showToast(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

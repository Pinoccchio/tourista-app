import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui'; // For blur effect
import 'Database_Helper/static_users.dart';

class Profile extends StatefulWidget {
  final User user;

  const Profile({required this.user});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final profileImageUrl = await _uploadImageToFirestore(pickedFile);
      await _updateProfileImageInFirestore(profileImageUrl);

      // Show SnackBar upon successful image selection and upload
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image selected and uploaded successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Future<String> _uploadImageToFirestore(XFile file) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_pictures/${widget.user.studentNumber}.jpg');
    await storageRef.putFile(File(file.path));
    return await storageRef.getDownloadURL();
  }

  Future<void> _updateProfileImageInFirestore(String profileImageUrl) async {
    final studentNumber = widget.user.studentNumber;
    if (studentNumber != null && studentNumber.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(studentNumber)
            .update({'profilePictureUrl': profileImageUrl});
      } catch (e) {
        Fluttertoast.showToast(
          msg: "Error updating profile picture: $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Error: Student number is invalid.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('studentNumber');

    Fluttertoast.showToast(
      msg: "Signed out successfully!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // Close the application
    SystemNavigator.pop();
  }

  void _showProfileDialog(BuildContext context, String profileImageUrl) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent, // Ensure the blur is visible
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Transparent background for the dialog
          elevation: 0, // Remove any shadow or elevation
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Full-screen blur
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.transparent, // Transparent to only show blur
                  ),
                ),
              ),
              // Larger profile image in the center
              CircleAvatar(
                radius: 100,
                backgroundImage: profileImageUrl.isNotEmpty
                    ? NetworkImage(profileImageUrl)
                    : AssetImage('assets/images/default_pp.jpg') as ImageProvider,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(widget.user.studentNumber)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data?.data() as Map<String, dynamic>?;
            final profileImageUrl = data?['profilePictureUrl'] as String? ?? '';
            final firstName = data?['firstName'] as String? ?? '';
            final lastName = data?['lastName'] as String? ?? '';
            final studentNumber = data?['studentNumber'] as String? ?? '';

            return Column(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/vectors/vector_46_x2.svg'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF252525),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 15,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              '$firstName $lastName',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              studentNumber,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF73CBE6),
                              ),
                            ),
                            SizedBox(height: 20),
                            _buildProfileDetail('Student Number', studentNumber),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -50,
                        left: (MediaQuery.of(context).size.width / 2) - 65,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () => _showProfileDialog(context, profileImageUrl),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: profileImageUrl.isNotEmpty
                                    ? NetworkImage(profileImageUrl)
                                    : AssetImage('assets/images/default_pp.jpg') as ImageProvider,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_63_x2.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () => _signOut(context),
                  child: _buildSignOutButton(),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.grey[400],
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSignOutButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF252525),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/vectors/container_17_x2.svg',
            width: 24,
            height: 24,
          ),
          SizedBox(width: 10),
          Text(
            'Sign Out',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

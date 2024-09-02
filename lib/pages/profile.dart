import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Database_Helper/FirestoreDatabaseHelper.dart';
import 'Database_Helper/static_users.dart';

class Profile extends StatefulWidget {
  final User user;

  const Profile({required this.user});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _profileImageUrl;
  bool _isLoading = true; // Add a loading state
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _profileImageUrl = widget.user.profilePictureUrl;
    _isLoading = false; // Data is already loaded from Home
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final profileImageUrl = await _uploadImageToFirestore(pickedFile);
      setState(() {
        _profileImageUrl = profileImageUrl;
      });

      // Update the profile picture URL in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.studentNumber)
          .update({'profilePictureUrl': profileImageUrl});
    }
  }

  Future<String> _uploadImageToFirestore(XFile file) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profile_pictures/${widget.user.studentNumber}.jpg');
    await storageRef.putFile(File(file.path)); // Correct usage of File
    return await storageRef.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40), // Padding for status bar
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/vectors/vector_46_x2.svg'),
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
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
                        SizedBox(height: 20), // Space for profile image
                        Text(
                          '${widget.user.firstName} ${widget.user.lastName}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.user.studentNumber,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF73CBE6),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildProfileDetail('Student Number', widget.user.studentNumber),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 65,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _isLoading
                              ? AssetImage('assets/images/placeholder.png') as ImageProvider
                              : (_profileImageUrl != null
                              ? NetworkImage(_profileImageUrl!)
                              : AssetImage('assets/images/placeholder.png') as ImageProvider),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage, // Trigger the image picker
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
            _buildSignOutButton(),
          ],
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
          SizedBox(width: 12),
          Text(
            'Sign Out',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

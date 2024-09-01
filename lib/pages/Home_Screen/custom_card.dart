import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String time;
  final String words;
  final String date;
  final String profileIcon;
  final String menuIcon;

  const CustomCard({
    Key? key,
    required this.title,
    required this.time,
    required this.words,
    required this.date,
    required this.profileIcon,
    required this.menuIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF171717),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20, // The size of the CircleAvatar
                  backgroundColor: Colors.blueGrey, // Set to transparent or any other color if needed
                  child: SizedBox(
                    width: 24, // Smaller width for the image
                    height: 24, // Smaller height for the image
                    child: Image.asset('assets/images/vector_4_x2.png'),
                  ),
                ),


                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevents overflow
                  ),
                ),
                SizedBox(width: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 42, // Adjust width
                    height: 42, // Adjust height
                    child: Lottie.asset(
                      menuIcon,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '$time • $words',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis, // Ensures long text wraps
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF949494),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

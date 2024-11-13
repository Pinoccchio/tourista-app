import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MenuItem extends StatelessWidget {
  final String iconPath;
  final String label;

  const MenuItem({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFF73CBE6), Color(0xFF52C3E6)],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x33DDDDDD),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Use Lottie.asset for animated icons
          Lottie.asset(
            iconPath,
            width: 54,
            height: 54,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.getFont(
              'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

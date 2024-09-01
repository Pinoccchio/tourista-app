import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFF000000),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, 0),
                end: Alignment(1, 0),
                colors: <Color>[Color(0xFF73CBE6), Color(0xFF52C3E6)],
                stops: <double>[0, 1],
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 13, 14.3, 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10.1, 0, 0, 21),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Text(
                                '9:41',
                                style: GoogleFonts.getFont(
                                  'Roboto Condensed',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  height: 1.3,
                                  letterSpacing: -0.2,
                                  color: Color(0xFF171717),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 21,
                                  child: Text(
                                    '9:41',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      height: 1.3,
                                      letterSpacing: -0.2,
                                      color: Color(0xFF171717),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 4.3, 0, 4.3),
                            child: SizedBox(
                              width: 66.7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0.3, 5, 0.3),
                                    child: SizedBox(
                                      width: 17,
                                      height: 10.7,
                                      child: SvgPicture.asset(
                                        'assets/vectors/container_15_x2.svg',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0.3),
                                    child: SizedBox(
                                      width: 15.3,
                                      height: 11,
                                      child: SvgPicture.asset(
                                        'assets/vectors/container_22_x2.svg',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: SizedBox(
                                      width: 24.3,
                                      height: 11.3,
                                      child: SvgPicture.asset(
                                        'assets/vectors/container_3_x2.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 188.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                              width: 24,
                              height: 24,
                              child: SizedBox(
                                width: 6,
                                height: 12,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_65_x2.svg',
                                ),
                              ),
                            ),
                            Text(
                              'Profile',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                height: 1.3,
                                color: Color(0xFF171717),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            child: Container(
              width: 375,
              height: 34,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: 134,
                  height: 5,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 170,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFF171717),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D000000),
                    offset: Offset(0, 0),
                    blurRadius: 29,
                  ),
                ],
              ),
              child: SizedBox(
                width: 343,
                height: 346,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(99.1, 0, 0, 40),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                child: Text(
                                  'John Doe',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0.4, 0, 0, 0),
                                child: Text(
                                  'John01',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    height: 1.3,
                                    color: Color(0xFF73CBE6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Email ID',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'John@example.com',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: Color(0xFFB3B3B3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Birthday',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '18/04/1996',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: Color(0xFFB3B3B3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 104,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/ellipse_68.png',
                  ),
                ),
              ),
              child: Stack(
                children: [
                Positioned(
                  right: -13.4,
                  top: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
          Container(
                    width: 160,
                    height: 160,
                    padding: EdgeInsets.fromLTRB(13.4, 0, 13.4, 13.3),
                    child: Container(
                      width: 16,
                      height: 16,
                      child: SizedBox(
                        width: 13.2,
                        height: 13.2,
                        child: SvgPicture.asset(
                          'assets/vectors/vector_90_x2.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF171717),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 343,
                height: 80,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: SvgPicture.asset(
                          'assets/vectors/container_2_x2.svg',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        child: Text(
                          'Sign Out',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 1.3,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF000000),
                ),
                child: Container(
                  width: 375,
                  height: 812,
                  padding: EdgeInsets.fromLTRB(34, 0, 34, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF171717),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Text(
                                'Sign Out',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Text(
                                'Are you sure you want to log out?',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.1,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF171717),
                                ),
                                child: Container(
                                  width: 130,
                                  height: 1,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 17, 0),
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFF73CBE6)),
                                      borderRadius: BorderRadius.circular(27),
                                    ),
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        height: 1.1,
                                        color: Color(0xFF73CBE6),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27),
                                      gradient: LinearGradient(
                                        begin: Alignment(-1, 0),
                                        end: Alignment(1, 0),
                                        colors: <Color>[Color(0xFF73CBE6), Color(0xFF52C3E6)],
                                        stops: <double>[0, 1],
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                                      child: Text(
                                        'Sign Out',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          height: 1.1,
                                          color: Color(0xFF171717),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
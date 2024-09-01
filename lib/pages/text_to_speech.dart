import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class TextToSpeech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFF000000),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF000000),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(25, 13, 14.3, 14),
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
                                          color: Color(0xFFFFFFFF),
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
                                              color: Color(0xFFFFFFFF),
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
                                                'assets/vectors/container_11_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0.3),
                                            child: SizedBox(
                                              width: 15.3,
                                              height: 11,
                                              child: SvgPicture.asset(
                                                'assets/vectors/container_14_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: SizedBox(
                                              width: 24.3,
                                              height: 11.3,
                                              child: SvgPicture.asset(
                                                'assets/vectors/container_24_x2.svg',
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
                                width: 229.7,
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
                                          'assets/vectors/vector_42_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Text-To-Speech',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFFFFFFFF),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(18, 0, 14, 123),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF171717),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(14, 20, 32, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Upload File',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        height: 1.3,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'PDF or Word File',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.1,
                                    color: Color(0xFF949494),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 6, 0, 8),
                              child: SizedBox(
                                width: 36,
                                height: 34,
                                child: SvgPicture.asset(
                                  'assets/vectors/upload_x2.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 23),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF171717),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                        Positioned(
                          top: 1,
                          child: SizedBox(
                            width: 343,
                            height: 138.9,
                            child: SvgPicture.asset(
                              'assets/vectors/group_x2.svg',
                            ),
                          ),
                        ),
                  SizedBox(
                            width: 343,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8.1, 8, 8.1, 126),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: SizedBox(
                                      width: 33,
                                      child: Text(
                                        '00:45',
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
                                    '05:00',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.3,
                                      color: Color(0xFFFFFFFF),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(1, 0, 0, 34),
                    child: SizedBox(
                      width: 262,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 40.6, 0, 40.6),
                            width: 40,
                            height: 40,
                            child: SizedBox(
                              width: 40,
                              height: 28.9,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_x2.svg',
                              ),
                            ),
                          ),
                          Container(
                            width: 110,
                            height: 110,
                            child: SizedBox(
                              width: 110,
                              height: 110,
                              child: SvgPicture.asset(
                                'assets/vectors/group_2_x2.svg',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 40.6, 0, 40.6),
                            width: 40,
                            height: 40,
                            child: SizedBox(
                              width: 40,
                              height: 28.9,
                              child: SvgPicture.asset(
                                'assets/vectors/vector_9_x2.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16.3, 0, 16.4, 41),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: SizedBox(
                            width: 59,
                            child: Text(
                              'Repeat',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                height: 1.3,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'x 0.5',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 1.3,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(18, 0, 14, 36),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF171717),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 13),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 16, 3),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: SizedBox(
                                            width: 48,
                                            height: 48,
                                            child: SvgPicture.asset(
                                              'assets/vectors/rectangle_10_x2.svg',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Voice 04',
                                                style: GoogleFonts.getFont(
                                                  'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  height: 1.3,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: '00:03:00 ',
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.1,
                                                color: Color(0xFF949494),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: '|',
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.3,
                                                    color: Color(0xFF73CBE6),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 407 Words',
                                                  style: GoogleFonts.getFont(
                                                    'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.1,
                                                    color: Color(0xFF949494),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 4, 0, 3),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(11, 0, 11, 12),
                                          child: SizedBox(
                                            width: 24,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                  child: SizedBox(
                                                    width: 2,
                                                    height: 2,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_84_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                  child: SizedBox(
                                                    width: 2,
                                                    height: 2,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/vector_37_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                  height: 2,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/vector_54_x2.svg',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Feb 10',
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.3,
                                            color: Color(0xFF949494),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 13,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: SizedBox(
                                  width: 22,
                                  height: 16,
                                  child: SvgPicture.asset(
                                    'assets/vectors/vector_7_x2.svg',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
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
                ],
              ),
            ),
            Positioned(
              top: 235,
              child: SizedBox(
                height: 36,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 48,
                      height: 0.8,
                      color: Color(0xFF73CBE6),
                    ),
                    children: [
                      TextSpan(
                        text: '00:0',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 48,
                          height: 1.3,
                          color: Color(0xFF949494),
                        ),
                      ),
                      TextSpan(
                        text: '6.10',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 48,
                          height: 0.8,
                          color: Color(0xFF73CBE6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
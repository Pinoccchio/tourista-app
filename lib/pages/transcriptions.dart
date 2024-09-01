import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Transcriptions extends StatelessWidget {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF000000),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 13, 14.3, 14),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: double.infinity,
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
                                  Container(
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
                                                'assets/vectors/container_9_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0.3),
                                            child: SizedBox(
                                              width: 15.3,
                                              height: 11,
                                              child: SvgPicture.asset(
                                                'assets/vectors/container_20_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: SizedBox(
                                              width: 24.3,
                                              height: 11.3,
                                              child: SvgPicture.asset(
                                                'assets/vectors/container_7_x2.svg',
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
                                width: 222.6,
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
                                          'assets/vectors/vector_3_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Transcriptions',
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
                      Positioned(
                        left: 10.1,
                        top: 0,
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
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                        'assets/vectors/rectangle_8_x2.svg',
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                                      child: Text(
                                        'Design Inspiration',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          height: 1.3,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 6.8, 0),
                                      child: RichText(
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
                                                'assets/vectors/vector_45_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: SizedBox(
                                              width: 2,
                                              height: 2,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                            height: 2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_1_x2.svg',
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
                              'assets/vectors/vector_56_x2.svg',
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
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                        'assets/vectors/rectangle_9_x2.svg',
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
                                          'Food Recipe',
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
                                        text: '00:08:00 ',
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
                                            text: ' 1024 Words',
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
                                                'assets/vectors/vector_36_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: SizedBox(
                                              width: 2,
                                              height: 2,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_68_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                            height: 2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_89_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Feb 16',
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
                              'assets/vectors/vector_14_x2.svg',
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
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                        'assets/vectors/rectangle_3_x2.svg',
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
                                          'Voice 01',
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
                                        text: '00:02:00 ',
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
                                            text: ' 201 Words',
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
                                                'assets/vectors/vector_11_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: SizedBox(
                                              width: 2,
                                              height: 2,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_48_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                            height: 2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_87_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Feb 19',
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
                              'assets/vectors/vector_66_x2.svg',
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
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                        'assets/vectors/rectangle_1_x2.svg',
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
                                          'Voice 02',
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
                                        text: '00:01:00 ',
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
                                            text: ' 100 Words',
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
                                                'assets/vectors/vector_51_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: SizedBox(
                                              width: 2,
                                              height: 2,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_74_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                            height: 2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_75_x2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Feb 20',
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
                              'assets/vectors/vector_70_x2.svg',
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
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                                        'assets/vectors/rectangle_7_x2.svg',
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
                                          'Voice 03',
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
                                                'assets/vectors/vector_73_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: SizedBox(
                                              width: 2,
                                              height: 2,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_23_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                            height: 2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_44_x2.svg',
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
                              'assets/vectors/vector_16_x2.svg',
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
              margin: EdgeInsets.fromLTRB(16, 0, 16, 135),
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
                                        'assets/vectors/rectangle_2_x2.svg',
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
                                                'assets/vectors/vector_76_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                            child: SizedBox(
                                              width: 2,
                                              height: 2,
                                              child: SvgPicture.asset(
                                                'assets/vectors/vector_80_x2.svg',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                            height: 2,
                                            child: SvgPicture.asset(
                                              'assets/vectors/vector_58_x2.svg',
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
                              'assets/vectors/vector_64_x2.svg',
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
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class StudyPlanner1 extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 26),
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
                                          'assets/vectors/container_12_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0.3),
                                      child: SizedBox(
                                        width: 15.3,
                                        height: 11,
                                        child: SvgPicture.asset(
                                          'assets/vectors/container_23_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: SizedBox(
                                        width: 24.3,
                                        height: 11.3,
                                        child: SvgPicture.asset(
                                          'assets/vectors/container_25_x2.svg',
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
                          width: 219.7,
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
                                    'assets/vectors/vector_24_x2.svg',
                                  ),
                                ),
                              ),
                              Text(
                                'Study Planner',
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
              margin: EdgeInsets.fromLTRB(22, 0, 24, 26),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE4EDFF)),
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFFFFFFF),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(6, 5, 25.3, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 23.1, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFF2FD1C5),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0D1C252C),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 4, 9),
                          child: Text(
                            'To Do',
                            style: GoogleFonts.getFont(
                              'Almarai',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              height: 1.2,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 8, 33.4, 10),
                      child: Text(
                        'In Progress',
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF00394C),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
                      child: Text(
                        'Completed',
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF00394C),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24.1, 0, 24.1, 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 4, 9.1, 2),
                    width: 15,
                    height: 15,
                    child: SizedBox(
                      width: 13,
                      height: 13,
                      child: SvgPicture.asset(
                        'assets/vectors/vector_28_x2.svg',
                      ),
                    ),
                  ),
                  Text(
                    'New Task',
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.2,
                      color: Color(0xFF2FD1C5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22, 0, 24, 26),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFF7A7B)),
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D1C252C),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(17, 11, 15, 11),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -46,
                      bottom: -11,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFF7A7B),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 33,
                          height: 104,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(1.5, 0, 1.5, 7),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 1, 12.5, 0.5),
                                        width: 16,
                                        height: 16,
                                        child: SizedBox(
                                          width: 14.9,
                                          height: 15.5,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_72_x2.svg',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '11:30 AM - 12:30 PM',
                                        style: GoogleFonts.getFont(
                                          'Lato',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.4,
                                          color: Color(0xE59A9A9A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Math',
                                    style: GoogleFonts.getFont(
                                      'Almarai',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      height: 1.2,
                                      color: Color(0xFF242736),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Create a unique emotional story that describes better than words',
                                style: GoogleFonts.getFont(
                                  'Lato',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.4,
                                  color: Color(0xFF585A66),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 28, 0, 32),
                            child: SizedBox(
                              width: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD8DEF3),
                                        borderRadius: BorderRadius.circular(2.5),
                                      ),
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD8DEF3),
                                        borderRadius: BorderRadius.circular(2.5),
                                      ),
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD8DEF3),
                                      borderRadius: BorderRadius.circular(2.5),
                                    ),
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22, 0, 24, 26),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF26BFBF)),
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D1C252C),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(17, 11, 15, 11),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -46,
                      bottom: -11,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF26BFBF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 33,
                          height: 104,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(1.5, 0, 1.5, 7),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 1.5, 12.5, 0.5),
                                        width: 16,
                                        height: 16,
                                        child: SizedBox(
                                          width: 14.9,
                                          height: 14.9,
                                          child: SvgPicture.asset(
                                            'assets/vectors/vector_2_x2.svg',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '11:30 AM - 12:30 PM',
                                        style: GoogleFonts.getFont(
                                          'Lato',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.4,
                                          color: Color(0xE59A9A9A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Geometry',
                                    style: GoogleFonts.getFont(
                                      'Almarai',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      height: 1.2,
                                      color: Color(0xFF242736),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Create a unique emotional story that describes better than words',
                                style: GoogleFonts.getFont(
                                  'Lato',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.4,
                                  color: Color(0xFF585A66),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 28, 0, 32),
                            child: SizedBox(
                              width: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD8DEF3),
                                        borderRadius: BorderRadius.circular(2.5),
                                      ),
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD8DEF3),
                                        borderRadius: BorderRadius.circular(2.5),
                                      ),
                                      child: Container(
                                        width: 5,
                                        height: 5,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD8DEF3),
                                      borderRadius: BorderRadius.circular(2.5),
                                    ),
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(21, 0, 25, 202),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC4D7FF)),
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFF5FBFF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D1C252C),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(17, 11, 17, 11),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -45,
                      bottom: -11,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF57E597),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 33,
                          height: 104,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(1.5, 0, 1.5, 7),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 2.6, 12.5, 0.5),
                                  width: 16,
                                  height: 16,
                                  child: SizedBox(
                                    width: 14.9,
                                    height: 13.9,
                                    child: SvgPicture.asset(
                                      'assets/vectors/vector_34_x2.svg',
                                    ),
                                  ),
                                ),
                                Text(
                                  '10:30 AM - 11:30 AM',
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.4,
                                    color: Color(0xE59A9A9A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Programming',
                              style: GoogleFonts.getFont(
                                'Almarai',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                height: 1.2,
                                color: Color(0xFF242736),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Create a unique emotional story that describes better than words',
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 1.4,
                            color: Color(0xFF585A66),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
              child: Align(
                alignment: Alignment.topCenter,
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
            ),
          ],
        ),
      ),
    );
  }
}
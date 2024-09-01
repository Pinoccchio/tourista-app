import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class StudyPlanner extends StatelessWidget {
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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 33),
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
                                                'assets/vectors/container_26_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 5, 0.3),
                                            child: SizedBox(
                                              width: 15.3,
                                              height: 11,
                                              child: SvgPicture.asset(
                                                'assets/vectors/container_6_x2.svg',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: SizedBox(
                                              width: 24.3,
                                              height: 11.3,
                                              child: SvgPicture.asset(
                                                'assets/vectors/container_16_x2.svg',
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
                                width: 218.9,
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
                                          'assets/vectors/vector_59_x2.svg',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Create a Task',
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
              margin: EdgeInsets.fromLTRB(21, 0, 25, 24),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE4EDFF)),
                borderRadius: BorderRadius.circular(8),
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
                padding: EdgeInsets.fromLTRB(16, 18, 16, 18),
                child: Text(
                  'Name',
                  style: GoogleFonts.getFont(
                    'Lato',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF585A66),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 9, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE4EDFF)),
                        borderRadius: BorderRadius.circular(8),
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
                        padding: EdgeInsets.fromLTRB(16.5, 18, 0, 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 2.5, 12.5, 2),
                              width: 16,
                              height: 16,
                              child: SizedBox(
                                width: 14.9,
                                height: 15.5,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_13_x2.svg',
                                ),
                              ),
                            ),
                            Text(
                              'Start Time',
                              style: GoogleFonts.getFont(
                                'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1.4,
                                color: Color(0xFF585A66),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE4EDFF)),
                        borderRadius: BorderRadius.circular(8),
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
                        padding: EdgeInsets.fromLTRB(18.7, 18, 0, 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 2.5, 14.7, 2),
                              width: 16,
                              height: 16,
                              child: SizedBox(
                                width: 10.7,
                                height: 15.5,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_49_x2.svg',
                                ),
                              ),
                            ),
                            Text(
                              'End Time',
                              style: GoogleFonts.getFont(
                                'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1.4,
                                color: Color(0xFF585A66),
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
            Container(
              margin: EdgeInsets.fromLTRB(21, 0, 25, 33),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE4EDFF)),
                borderRadius: BorderRadius.circular(8),
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
                padding: EdgeInsets.fromLTRB(16, 19, 11.7, 13.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 70.9),
                      child: SizedBox(
                        width: 43,
                        child: Text(
                          'Details',
                          style: GoogleFonts.getFont(
                            'Lato',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.4,
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 74.9, 0, 0),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          'assets/vectors/group_216_x2.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 7, 296),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF2FD1C5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x141C252C),
                    offset: Offset(0, 14),
                    blurRadius: 11.5,
                  ),
                ],
              ),
              child: Container(
                width: 250,
                padding: EdgeInsets.fromLTRB(0, 21, 0, 21),
                child: Text(
                  'Create',
                  style: GoogleFonts.getFont(
                    'Almarai',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    height: 1.2,
                    color: Color(0xFFFFFFFF),
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
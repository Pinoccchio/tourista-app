import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StudyPlanner1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF000000),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 33),
              padding: EdgeInsets.fromLTRB(25, 13, 14.3, 14),
              decoration: BoxDecoration(
                color: Color(0xFF000000),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 66.7,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/vectors/container_26_x2.svg',
                              width: 17,
                              height: 10.7,
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset(
                              'assets/vectors/container_6_x2.svg',
                              width: 15.3,
                              height: 11,
                            ),
                            SizedBox(width: 5),
                            SvgPicture.asset(
                              'assets/vectors/container_16_x2.svg',
                              width: 24.3,
                              height: 11.3,
                            ),
                          ],
                        ),
                      ),
                      // Removed the '9:41' text and related elements
                    ],
                  ),
                  SizedBox(height: 21),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/vectors/vector_59_x2.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Create a Task',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ],
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
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 18, 16, 18),
                child: Text(
                  'Name',
                  style: GoogleFonts.getFont(
                    'Lato',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF585A66),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16.5, 18, 0, 18),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/vectors/vector_13_x2.svg',
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 12.5),
                            Text(
                              'Start Time',
                              style: GoogleFonts.getFont(
                                'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
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
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(18.7, 18, 0, 18),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/vectors/vector_49_x2.svg',
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 14.7),
                            Text(
                              'End Time',
                              style: GoogleFonts.getFont(
                                'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
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
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 19, 11.7, 13.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Details',
                      style: GoogleFonts.getFont(
                        'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/vectors/group_216_x2.svg',
                      width: 16,
                      height: 16,
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
                child: Center(
                  child: Text(
                    'Create',
                    style: GoogleFonts.getFont(
                      'Almarai',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
              width: 375,
              height: 34,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                width: 134,
                height: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

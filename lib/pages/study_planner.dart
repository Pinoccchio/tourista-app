import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudyPlanner extends StatefulWidget {
  final String studentNumber;

  StudyPlanner({required this.studentNumber});

  @override
  _StudyPlannerState createState() => _StudyPlannerState();
}

class _StudyPlannerState extends State<StudyPlanner>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Center(
          child: Text(
            'Study Planner',
            style: GoogleFonts.almarai(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[400],
          indicator: BoxDecoration(
            color: Color(0xFF2FD1C5),
            borderRadius: BorderRadius.circular(8),
          ),
          tabs: [
            _buildTab('To Do'),
            _buildTab('In Progress'),
            _buildTab('Completed'),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            _buildNewTaskButton(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTaskList(context, 'To Do'),
                  _buildTaskList(context, 'In Progress'),
                  _buildTaskList(context, 'Completed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Button to add a new task
  Widget _buildNewTaskButton() {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 24),
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: () {
          // Show dialog when the button is clicked
          _showNewTaskDialog(context);
        },
        icon: Icon(Icons.add, color: Color(0xFF57E597)),
        label: Text(
          'New Task',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF57E597)),
        ),
      ),
    );
  }

  // Dialog function
  void _showNewTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color(0xFF000000),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Create a Task',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildDialogTextField('Subject'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildDialogTextField('Start Time')),
                    SizedBox(width: 10),
                    Expanded(child: _buildDialogTextField('End Time')),
                  ],
                ),
                SizedBox(height: 20),
                _buildDialogTextField('Details'),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2FD1C5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Handle task creation logic
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Create',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper function to build input fields in the dialog
  Widget _buildDialogTextField(String labelText) {
    return TextField(
      style: GoogleFonts.lato(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.lato(color: Color(0xFF585A66)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE4EDFF)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF57E597)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildTab(String text) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskList(BuildContext context, String taskType) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSection(
            context,
            sectionColor: Color(0xFF57E597),
            time: '09:30 AM - 10:30 AM',
            title: 'Math',
            description:
            'Create a unique emotional story that describes better than words...',
            svgAsset: 'assets/vectors/vector_2_x2.svg',
          ),
          _buildSection(
            context,
            sectionColor: Color(0xFF26BFBF),
            time: '11:30 AM - 12:30 PM',
            title: 'Geometry',
            description:
            'Create a unique emotional story that describes better than words...',
            svgAsset: 'assets/vectors/vector_2_x2.svg',
          ),
          _buildSection(
            context,
            sectionColor: Color(0xFFC4D7FF),
            time: '10:30 AM - 11:30 AM',
            title: 'Programming',
            description:
            'Create a unique emotional story that describes better than words...',
            svgAsset: 'assets/vectors/vector_34_x2.svg',
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, {
        required Color sectionColor,
        required String time,
        required String title,
        required String description,
        required String svgAsset,
      }) {
    return Container(
      margin: EdgeInsets.fromLTRB(22, 0, 24, 26),
      decoration: BoxDecoration(
        border: Border.all(color: sectionColor),
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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -20,
            top: 0,
            bottom: 0,
            child: Container(
              width: 8,
              decoration: BoxDecoration(
                color: sectionColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 11, 17, 11),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  svgAsset,
                  width: 16,
                  height: 16,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.4,
                          color: Color(0xE59A9A9A),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        title,
                        style: GoogleFonts.almarai(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 1.2,
                          color: Color(0xFF292929),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        description,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.2,
                          color: Color(0xFF1C252C),
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
    );
  }
}

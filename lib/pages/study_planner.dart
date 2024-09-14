import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting

class StudyPlanner extends StatefulWidget {
  final String studentNumber;

  StudyPlanner({required this.studentNumber});

  @override
  _StudyPlannerState createState() => _StudyPlannerState();
}

class _StudyPlannerState extends State<StudyPlanner>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Timer? _taskCheckTimer;

  @override
  void initState() {
    super.initState();
    _startRealTimeTaskChecker();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _taskCheckTimer?.cancel(); // Stop the timer when the widget is disposed
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
            _buildTab('Missed'),
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
                  _buildTaskList(context, 'Missed'),
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

  void _showNewTaskDialog(BuildContext context) {
    final subjectController = TextEditingController();
    final startDateTimeController = TextEditingController(); // For both date and time
    final endDateTimeController = TextEditingController();   // For both date and time
    final detailsController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color(0xFF000000),
          child: Container(
            width: screenSize.width * 0.9, // 90% of screen width
            height: screenSize.height * 0.7, // 70% of screen height
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  _buildDialogTextField('Subject', controller: subjectController),
                  SizedBox(height: 20),
                  _buildDateTimePicker('Start Date & Time', controller: startDateTimeController, context: context),
                  SizedBox(height: 20),
                  _buildDateTimePicker('End Date & Time', controller: endDateTimeController, context: context),
                  SizedBox(height: 20),
                  _buildDialogTextField('Details', controller: detailsController),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2FD1C5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        // Validate if all fields are filled
                        if (subjectController.text.isEmpty ||
                            startDateTimeController.text.isEmpty ||
                            endDateTimeController.text.isEmpty ||
                            detailsController.text.isEmpty) {
                          // Show error message if any field is empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all fields.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return; // Exit the function early
                        }

                        // Save task to Firestore as DateTime
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.studentNumber)
                            .collection('to-do-files')
                            .add({
                          'subject': subjectController.text,
                          'startTime': DateTime.parse(startDateTimeController.text), // Store as DateTime
                          'endTime': DateTime.parse(endDateTimeController.text),   // Store as DateTime
                          'details': detailsController.text,
                          'status': 'To Do', // Initial status
                          'createdAt': FieldValue.serverTimestamp(),
                        });

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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// Helper function to build input fields in the dialog
  Widget _buildDialogTextField(String labelText, {required TextEditingController controller}) {
    return TextField(
      controller: controller,
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

// Helper function to build DateTime picker
  Widget _buildDateTimePicker(String labelText, {required TextEditingController controller, required BuildContext context}) {
    return TextField(
      controller: controller,
      readOnly: true,
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
        suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null) {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (pickedTime != null) {
            final DateTime finalDateTime = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
            controller.text = finalDateTime.toIso8601String(); // Store full DateTime in ISO 8601 format
          }
        }
      },
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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.studentNumber)
          .collection('to-do-files')
          .where('status', isEqualTo: taskType) // Filter by status
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animated_icon/empty-animation.json', width: 200, height: 200),
                SizedBox(height: 20),
                Text('No tasks available.'),
              ],
            ),
          );
        }

        DateTime currentTime = DateTime.now();
        final DateFormat dateFormat = DateFormat('MMM d, yyyy'); // Format date
        final DateFormat timeFormat = DateFormat('h:mm a'); // Format time (e.g., 4:57 AM)

        return SingleChildScrollView(
          child: Column(
            children: snapshot.data!.docs.map((doc) {
              var data = doc.data() as Map<String, dynamic>;

              // Initialize endTime with a default value (e.g., current time) to prevent the error
              DateTime endTime = DateTime.now();
              String endTimeString;

              // Parse endTime from Firestore (Timestamp or String)
              if (data['endTime'] is Timestamp) {
                endTime = (data['endTime'] as Timestamp).toDate();
                endTimeString = '${dateFormat.format(endTime)} ${timeFormat.format(endTime)}'; // Include both date and time
              } else {
                // Handle string format and parse to DateTime if necessary
                endTimeString = data['endTime']; // Assuming this is already a combined date and time string
              }

              // Parse startTime from Firestore (Timestamp or String)
              String startTimeString;
              if (data['startTime'] is Timestamp) {
                startTimeString = '${dateFormat.format((data['startTime'] as Timestamp).toDate())} ${timeFormat.format((data['startTime'] as Timestamp).toDate())}';
              } else {
                startTimeString = data['startTime']; // Assuming this is a combined date and time string
              }

              // Mark task as missed if past end time
              if (taskType != 'Completed' && endTime.isBefore(currentTime)) {
                _markTaskAsMissed(doc.id);
              }

              return _buildSection(
                context,
                sectionColor: _getColorForTaskType(taskType),
                time: '$startTimeString - $endTimeString', // Show both startTime and endTime with date and time
                title: data['subject'],
                description: data['details'],
                svgAsset: 'assets/vectors/vector_2_x2.svg', // Update as needed
                onActionTap: () => _showActionMenu(context, doc.id),
                onCheckTap: () => _markTaskAsCompleted(doc.id),
              );
            }).toList(),
          ),
        );
      },
    );
  }


  void _startRealTimeTaskChecker() {
    _taskCheckTimer = Timer.periodic(Duration(minutes: 1), (timer) async {
      QuerySnapshot tasks = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.studentNumber)
          .collection('to-do-files')
          .where('status', isEqualTo: 'To Do')
          .get();

      DateTime currentTime = DateTime.now();
      tasks.docs.forEach((doc) {
        var data = doc.data() as Map<String, dynamic>;
        DateTime endTime = (data['endTime'] as Timestamp).toDate();

        if (endTime.isBefore(currentTime)) {
          _markTaskAsMissed(doc.id);  // Automatically mark task as "Missed"

        }
      });
    });
  }

  void _markTaskAsMissed(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.studentNumber)
          .collection('to-do-files')
          .doc(docId)
          .update({'status': 'Missed'});
    } catch (e) {
      // Handle error, if any
      print('Error updating task: $e');
    }
  }

  void _markTaskAsCompleted(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.studentNumber)
          .collection('to-do-files')
          .doc(docId)
          .update({'status': 'Completed'});

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Task marked as completed!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Handle error, if any
      print('Error updating task: $e');
    }
  }

  Widget _buildSection(
      BuildContext context, {
        required Color sectionColor,
        required String time,
        required String title,
        required String description,
        required String svgAsset,
        required VoidCallback onActionTap,
        required VoidCallback onCheckTap, // Ensure this parameter is defined
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
            padding: EdgeInsets.fromLTRB(24, 11, 24, 11), // Adjusted padding
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns content and pushes icons to the right
              children: [
                Expanded(
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
                SizedBox(width: 10),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.check, color: Colors.green, size: 24),
                      onPressed: onCheckTap, // Use the onCheckTap callback
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: onActionTap,
                      child: Icon(
                        Icons.more_vert, // Vertical icon
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showActionMenu(BuildContext context, String docId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.white),
                title: Text(
                  'Edit',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  //_showEditTaskDialog(context, docId);
                },
              ),
              Divider(color: Colors.grey[700]),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.white),
                title: Text(
                  'Delete',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _deleteTask(context, docId);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /*
  void _showEditTaskDialog(BuildContext context, String docId) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.studentNumber) // Use widget here
        .collection('to-do-files')
        .doc(docId)
        .get()
        .then((doc) {
      if (!mounted) return;

      var data = doc.data() as Map<String, dynamic>;

      showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xFF000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          final subjectController = TextEditingController(text: data['subject']);
          final startTimeController = TextEditingController(text: data['startTime']);
          final endTimeController = TextEditingController(text: data['endTime']);
          final detailsController = TextEditingController(text: data['details']);

          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(labelText: 'Subject'),
                  onChanged: (value) {
                    data['subject'] = value;
                  },
                ),
                TextField(
                  controller: startTimeController,
                  decoration: InputDecoration(labelText: 'Start Time'),
                  onChanged: (value) {
                    data['startTime'] = value;
                  },
                ),
                TextField(
                  controller: endTimeController,
                  decoration: InputDecoration(labelText: 'End Time'),
                  onChanged: (value) {
                    data['endTime'] = value;
                  },
                ),
                TextField(
                  controller: detailsController,
                  decoration: InputDecoration(labelText: 'Details'),
                  onChanged: (value) {
                    data['details'] = value;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (!mounted) return;

                        try {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(widget.studentNumber)
                              .collection('to-do-files')
                              .doc(docId)
                              .update(data);

                          Navigator.pop(context); // Close the bottom sheet
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Task updated successfully'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to update task'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Text('Update'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }).catchError((error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to fetch task data'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

   */

  void _deleteTask(BuildContext context, String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.studentNumber) // Use widget here
          .collection('to-do-files')
          .doc(docId)
          .delete();

      Fluttertoast.showToast(
        msg: 'Task deleted successfully.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to delete task.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

Color _getColorForTaskType(String taskType) {
  switch (taskType) {
    case 'To Do':
      return Color(0xFFC4D7FF); // Updated color for "To Do"
    case 'Missed':
      return Colors.red; // Red for "Missed"
    case 'Completed':
      return Color(0xFF57E597); // Updated color for "Completed"
    default:
      return Colors.grey;
  }
}

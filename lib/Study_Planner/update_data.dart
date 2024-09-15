import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class UpdateDataScreen extends StatefulWidget {
  final String docId;
  final String studentNumber;

  const UpdateDataScreen({
    required this.docId,
    required this.studentNumber,
  });

  @override
  _UpdateDataScreenState createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  late TextEditingController subjectController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  late TextEditingController detailsController;

  String? selectedStatus; // Add status dropdown selection
  Map<String, dynamic>? data;
  Map<String, dynamic>? originalData; // Store original data

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd hh:mm a'); // Define date format

  @override
  void initState() {
    super.initState();
    fetchTaskData();
  }

  Future<void> fetchTaskData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.studentNumber)
          .collection('to-do-files')
          .doc(widget.docId) // Use 'docId' here
          .get();

      if (doc.exists) {
        setState(() {
          data = doc.data() as Map<String, dynamic>;
          originalData = Map<String, dynamic>.from(data!); // Store original data

          var startTime = data!['startTime'];
          var endTime = data!['endTime'];

          subjectController = TextEditingController(text: data!['subject']);
          startTimeController = TextEditingController(
            text: startTime is Timestamp
                ? _formatDateTime(startTime.toDate())
                : startTime,
          );
          endTimeController = TextEditingController(
            text: endTime is Timestamp
                ? _formatDateTime(endTime.toDate())
                : endTime,
          );
          detailsController = TextEditingController(text: data!['details']);
          selectedStatus = data!['status']; // Fetch status from Firestore
        });
      } else {
        _showToast('Task not found.', Colors.red);
      }
    } catch (e) {
      _showToast('Failed to fetch task data: ${e.toString()}', Colors.red);
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return _dateFormat.format(dateTime); // Format date-time with AM/PM
  }

  DateTime _parseDateTime(String dateTimeStr) {
    return _dateFormat.parse(dateTimeStr); // Parse date-time string to DateTime
  }

  bool hasDataChanged() {
    return originalData!['subject'] != subjectController.text ||
        originalData!['startTime'] != startTimeController.text ||
        originalData!['endTime'] != endTimeController.text ||
        originalData!['details'] != detailsController.text ||
        originalData!['status'] != selectedStatus; // Check if status changed
  }

  void _showToast(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Widget _buildDialogTextField(String label, TextEditingController controller, bool isEnabled) {
    return TextField(
      controller: controller,
      enabled: isEnabled, // Disable if task is completed
      style: GoogleFonts.poppins(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.white),
        filled: true,
        fillColor: Color(0xFF1F1F1F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDateTimePicker(String label, TextEditingController controller, BuildContext context, bool isEnabled) {
    return TextField(
      controller: controller,
      enabled: isEnabled, // Disable if task is completed
      style: GoogleFonts.poppins(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.white),
        filled: true,
        fillColor: Color(0xFF1F1F1F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      readOnly: true,
      onTap: isEnabled ? () async {
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
            DateTime dateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            controller.text = _formatDateTime(dateTime); // Format date-time with AM/PM
          }
        }
      } : null,
    );
  }

  Widget _buildStatusDisplay() {
    return TextFormField(
      initialValue: selectedStatus,
      readOnly: true, // Always read-only for status
      style: GoogleFonts.poppins(
        color: selectedStatus == "Completed" ? Colors.grey.shade400 : Colors.white,
      ),
      decoration: InputDecoration(
        labelText: 'Status',
        labelStyle: GoogleFonts.poppins(
          color: selectedStatus == "Completed" ? Colors.grey.shade500 : Colors.white,
        ),
        filled: true,
        fillColor: selectedStatus == "Completed" ? Colors.grey.shade800 : Color(0xFF1F1F1F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isCompleted = selectedStatus == "Completed";

    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        title: Text(
          'Update Task',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildDialogTextField('Subject', subjectController, !isCompleted),
              SizedBox(height: 20),
              _buildDateTimePicker('Start Date & Time', startTimeController, context, !isCompleted),
              SizedBox(height: 20),
              _buildDateTimePicker('End Date & Time', endTimeController, context, !isCompleted),
              SizedBox(height: 20),
              _buildDialogTextField('Details', detailsController, !isCompleted),
              SizedBox(height: 20),
              _buildStatusDisplay(),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCompleted ? Colors.grey : Color(0xFF2FD1C5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: isCompleted
                      ? null
                      : () async {
                    if (!hasDataChanged()) {
                      _showToast('No changes detected.', Colors.yellow);
                      return;
                    }

                    try {
                      DateTime endTime = _parseDateTime(endTimeController.text);
                      String newStatus = selectedStatus ?? data!['status'];

                      if (newStatus == 'To Do' && endTime.isBefore(DateTime.now())) {
                        newStatus = 'Missed';
                      } else if (newStatus == 'Missed' && endTime.isAfter(DateTime.now())) {
                        newStatus = 'To Do';
                      }

                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.studentNumber)
                          .collection('to-do-files')
                          .doc(widget.docId)
                          .update({
                        'subject': subjectController.text,
                        'startTime': _parseDateTime(startTimeController.text),
                        'endTime': _parseDateTime(endTimeController.text),
                        'details': detailsController.text,
                        'status': newStatus,
                      });

                      Navigator.pop(context);
                      _showToast('Task updated successfully', Colors.green);
                    } catch (e) {
                      _showToast('Failed to update task: ${e.toString()}', Colors.red);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      isCompleted ? 'Task Completed' : 'Update',
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
  }
}

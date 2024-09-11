import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';

class TextToSpeech extends StatefulWidget {
  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  List<UploadedFile> uploadedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Text-To-Speech',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FileUploadWidget(onFilePicked: (result) {
              if (result != null) {
                PlatformFile file = result.files.first;
                _handleFileSelection(context, file);
              }
            }),
            const SizedBox(height: 20),
            // Display uploaded file containers
            ...uploadedFiles.map((file) => FileContainer(
              fileName: file.fileName,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileDetailsPage(
                      fileName: file.fileName,
                      extractedText: file.extractedText,
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  Future<void> _handleFileSelection(BuildContext context, PlatformFile file) async {
    Uint8List? fileBytes = file.bytes;
    if (fileBytes != null) {
      if (file.extension == 'pdf') {
        _extractAllText(context, fileBytes, file.name);
      } else if (file.extension == 'doc' || file.extension == 'docx') {
        await _launchConversionUrl(context);
      } else {
        print('Unsupported file type');
      }
    } else {
      try {
        File pickedFile = File(file.path!);
        fileBytes = await pickedFile.readAsBytes();
        if (file.extension == 'pdf') {
          _extractAllText(context, fileBytes, file.name);
        } else if (file.extension == 'doc' || file.extension == 'docx') {
          await _launchConversionUrl(context);
        }
      } catch (e) {
        print('Error reading file: $e');
      }
    }
  }

  Future<void> _extractAllText(BuildContext context, Uint8List fileBytes, String fileName) async {
    try {
      PdfDocument document = PdfDocument(inputBytes: fileBytes);
      PdfTextExtractor extractor = PdfTextExtractor(document);
      String text = extractor.extractText();

      setState(() {
        // Add a new file container with extracted text
        uploadedFiles.add(
          UploadedFile(
            fileName: fileName,
            extractedText: text,
          ),
        );
      });
    } catch (e) {
      print('Error extracting text: $e');
    }
  }

  Future<void> _launchConversionUrl(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('The selected file is a Word document. Convert it to PDF. Redirecting...'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 6),
      ),
    );

    await Future.delayed(const Duration(seconds: 6));

    const url = 'https://www.ilovepdf.com/word_to_pdf';
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class UploadedFile {
  final String fileName;
  final String extractedText;

  UploadedFile({required this.fileName, required this.extractedText});
}

class FileUploadWidget extends StatelessWidget {
  final Function(FilePickerResult?) onFilePicked;

  FileUploadWidget({required this.onFilePicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'doc', 'docx'],
        );
        onFilePicked(result);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upload File', style: TextStyle(color: Colors.white)),
                Text('PDF or Word File', style: TextStyle(color: Colors.grey)),
              ],
            ),
            const Icon(Icons.file_upload, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class FileContainer extends StatelessWidget {
  final String fileName;
  final VoidCallback onTap;

  FileContainer({required this.fileName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.insert_drive_file, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                fileName,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FileDetailsPage extends StatefulWidget {
  final String fileName;
  final String extractedText;

  FileDetailsPage({required this.fileName, required this.extractedText});

  @override
  _FileDetailsPageState createState() => _FileDetailsPageState();
}

class _FileDetailsPageState extends State<FileDetailsPage> {
  double _playbackSpeed = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000), // Black background
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          widget.fileName,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white, // White text
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.extractedText.isNotEmpty ? widget.extractedText : 'No text available.',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white, // White text
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ControlButtonsSection(
              onPlay: () {
                // Implement text-to-speech playback functionality
                print('Playing at speed $_playbackSpeed');
              },
              onRewind: () {
                // Implement rewind functionality
              },
              onForward: () {
                // Implement forward functionality
              },
              onSpeedChanged: (speed) {
                setState(() {
                  _playbackSpeed = speed ?? 1.0;
                });
              },
              currentSpeed: _playbackSpeed,
            ),
          ],
        ),
      ),
    );
  }
}

class ControlButtonsSection extends StatelessWidget {
  final void Function() onPlay;
  final void Function() onRewind;
  final void Function() onForward;
  final ValueChanged<double?> onSpeedChanged;
  final double currentSpeed;

  ControlButtonsSection({
    required this.onPlay,
    required this.onRewind,
    required this.onForward,
    required this.onSpeedChanged,
    required this.currentSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10, size: 36, color: Colors.white),
              onPressed: onRewind,
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow, size: 50, color: Color(0xFF73CBE6)),
              onPressed: onPlay,
            ),
            IconButton(
              icon: const Icon(Icons.forward_10, size: 36, color: Colors.white),
              onPressed: onForward,
            ),
          ],
        ),
        const SizedBox(height: 20), // Space between button section and speed control
        PlaybackSpeedControl(
          onSpeedChanged: onSpeedChanged,
          currentSpeed: currentSpeed,
        ),
      ],
    );
  }
}

class PlaybackSpeedControl extends StatelessWidget {
  final ValueChanged<double?> onSpeedChanged;
  final double currentSpeed;

  PlaybackSpeedControl({
    required this.onSpeedChanged,
    required this.currentSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Speed: ${currentSpeed}x',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white, // White text
          ),
        ),
        const SizedBox(width: 20),
        DropdownButton<double?>(
          value: currentSpeed,
          items: [0.5, 1.0, 1.5, 2.0].map((speed) {
            return DropdownMenuItem<double?>(
              value: speed,
              child: Text(
                '${speed}x',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white, // White text
                ),
              ),
            );
          }).toList(),
          onChanged: onSpeedChanged,
          dropdownColor: Colors.grey[800],
          underline: SizedBox(),
        ),
      ],
    );
  }
}
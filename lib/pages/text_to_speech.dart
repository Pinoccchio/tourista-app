import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
            Navigator.pop(context);
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
                      fileBytes: file.fileBytes,
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
        setState(() {
          uploadedFiles.add(UploadedFile(
            fileName: file.name,
            fileBytes: fileBytes!,
          ));
        });
      } else if (file.extension == 'doc' || file.extension == 'docx') {
        await _launchConversionUrl(context);
      } else {
        print('Unsupported file type');
      }
    } else {
      try {
        File pickedFile = File(file.path!);
        fileBytes = await pickedFile.readAsBytes();

        if (fileBytes != null) {
          if (file.extension == 'pdf') {
            setState(() {
              uploadedFiles.add(UploadedFile(
                fileName: file.name,
                fileBytes: fileBytes!,
              ));
            });
          } else if (file.extension == 'doc' || file.extension == 'docx') {
            await _launchConversionUrl(context);
          }
        } else {
          print('Error: fileBytes is null');
        }
      } catch (e) {
        print('Error reading file: $e');
      }
    }
  }

  Future<void> _launchConversionUrl(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('The selected file is a Word document. Convert it to PDF. Redirecting...'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      ),
    );

    await Future.delayed(const Duration(seconds: 5));

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
  final Uint8List fileBytes;

  UploadedFile({required this.fileName, required this.fileBytes});
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
  final Uint8List fileBytes;

  FileDetailsPage({required this.fileName, required this.fileBytes});

  @override
  _FileDetailsPageState createState() => _FileDetailsPageState();
}

class _FileDetailsPageState extends State<FileDetailsPage> {
  double _playbackSpeed = 0.5;
  bool _isPlaying = false;
  PdfViewerController _pdfViewerController = PdfViewerController();
  final FlutterTts _flutterTts = FlutterTts();
  String _selectedText = '';

  @override
  void initState() {
    super.initState();
    _flutterTts.setSpeechRate(_playbackSpeed);
    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

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
            _flutterTts.stop();
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.fileName,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SfPdfViewer.memory(
                widget.fileBytes,
                controller: _pdfViewerController,
                enableTextSelection: true,
                onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
                  setState(() {
                    _selectedText = details.selectedText ?? '';
                    print(_selectedText);
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ControlButtonsSection(
              onPlayPause: () {
                if (_isPlaying) {
                  _flutterTts.stop();
                } else {
                  if (_selectedText.isNotEmpty) {
                    _flutterTts.speak(_selectedText);
                  } else {
                    _flutterTts.speak("There is no text selected to read.");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("There is no text selected to read."),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              },
              onSpeedChanged: (speed) {
                setState(() {
                  _playbackSpeed = speed ?? 0.5;
                  _flutterTts.setSpeechRate(_playbackSpeed);
                });
              },
              currentSpeed: _playbackSpeed,
              isPlaying: _isPlaying,
            ),
          ],
        ),
      ),
    );
  }
}

class ControlButtonsSection extends StatelessWidget {
  final void Function() onPlayPause;
  final ValueChanged<double?> onSpeedChanged;
  final double currentSpeed;
  final bool isPlaying;

  ControlButtonsSection({
    required this.onPlayPause,
    required this.onSpeedChanged,
    required this.currentSpeed,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50,
                color: isPlaying ? Colors.red : Color(0xFF73CBE6),
              ),
              onPressed: onPlayPause,
            ),
          ],
        ),
        const SizedBox(height: 20),
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
            color: Colors.white,
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
                  color: Colors.white,
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

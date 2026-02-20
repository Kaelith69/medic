import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_scanner/components/utils.dart';
import 'package:ocr_scanner/screens/crop_screen.dart';
import 'package:ocr_scanner/screens/output_screen.dart';
import 'package:share_plus/share_plus.dart';

class OCRservice {
  Future<void> takePhoto(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (!context.mounted) return;

    if (pickedFile != null) {
      final newImg = await pickedFile.readAsBytes();
      if (!context.mounted) return;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CropScreen(image: newImg)));
    } else {
      showSnackBar(context: context, content: 'No image selected');
    }
  }

  Future<void> getPhoto(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (!context.mounted) return;

    if (pickedFile != null) {
      final newImg = await pickedFile.readAsBytes();
      if (!context.mounted) return;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CropScreen(image: newImg)));
    } else {
      showSnackBar(context: context, content: 'No image selected');
    }
  }

  Future<void> cropping(BuildContext context, Uint8List image) async {
    try {
      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/temp_ocr.png');
      await tempFile.writeAsBytes(image);
      if (!context.mounted) return;
      await _scanImage(context, tempFile.path);
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    }
  }

  Future<void> _scanImage(BuildContext context, String path) async {
    TextRecognizer? textRecognizer;
    try {
      textRecognizer = TextRecognizer();
      final inputImage = InputImage.fromFilePath(path);
      final RecognizedText recognisedText =
          await textRecognizer.processImage(inputImage);

      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => OutputScreen(
                    outputText: recognisedText.text,
                  )),
          (Route<dynamic> route) => false);
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    } finally {
      await textRecognizer?.close();
    }
  }

  Future<void> shareOutput(BuildContext context, String text) async {
    try {
      Share.share(text);
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    }
  }
}

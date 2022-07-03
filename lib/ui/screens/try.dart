import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Try extends StatefulWidget {
  const Try({Key? key}) : super(key: key);

  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        _getFromGallery();
                      },
                      child: SizedBox(
                        height: screenWidth / 7,
                        width: screenWidth / 7,
                        child: Image.asset(
                          "assets/images/camera.png",
                          width: screenWidth / 7,
                          height: screenWidth / 7,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      height: screenWidth / 7,
                      width: screenWidth / 7,
                      // alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Colors.black87, width: 1.5),
                            left: BorderSide(),
                            bottom: BorderSide(),
                            right: BorderSide(),
                          )
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Center(
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          IconButton(
                            alignment: Alignment.topLeft,
                            highlightColor: Colors.white,
                            focusColor: Colors.white,
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {
                              setState(() {
                                imageFile = null;
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                  )));
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}

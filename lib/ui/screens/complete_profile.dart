import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtual_vivah/ui/components/common_stack.dart';
import 'package:virtual_vivah/ui/components/radio_buttons.dart';
import 'package:virtual_vivah/ui/components/vv_text_field.dart';
import 'package:virtual_vivah/ui/screens/verify_otp_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: screenHeight,
        child: CommonStack(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          screenContent: const CompleteProfileColumn(),
          label: "Complete Profile",
          nextScreen: const VerifyOTPScreen(),
        ),
      ),
    );
  }
}

class CompleteProfileColumn extends StatefulWidget {
  const CompleteProfileColumn({Key? key}) : super(key: key);

  @override
  State<CompleteProfileColumn> createState() => _CompleteProfileColumnState();
}

class _CompleteProfileColumnState extends State<CompleteProfileColumn> {
  bool checkedValue = false;
  File? imageFile;

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 3.5,
              left: 24.0,
              right: 24.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
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
                          : Container(
                              height: screenWidth / 7,
                              width: screenWidth / 7,
                              // alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  top: BorderSide(
                                      color: Colors.black87, width: 1.5),
                                  left: BorderSide(),
                                  bottom: BorderSide(),
                                  right: BorderSide(),
                                ),
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
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    AutoSizeText(
                      "Upload Profile Picture",
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                AutoSizeText(
                  "Choose how your matches can contact you?",
                  maxLines: 2,
                  style: GoogleFonts.inter(
                      fontSize: 24.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: screenHeight / 36,
                ),
                RadioButtons(
                  labelOne: 'On Phone Call',
                  imageOne: Column(
                    children: [
                      const Spacer(),
                      Image.asset("assets/images/call.png"),
                      const Spacer(),
                    ],
                  ),
                  imageTwo: Column(
                    children: [
                      const Spacer(),
                      Image.asset("assets/images/WA.png"),
                      const Spacer(),
                    ],
                  ),
                  labelTwo: 'On Whatsapp',
                ),
                SizedBox(
                  height: screenHeight / 28.0,
                ),
                const VVTextField(
                  label: 'Mobile Number',
                  obscureText: false,
                  textType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CheckboxListTile(
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.all(0.0),
                    title: RichText(
                      text: TextSpan(
                        text: "By clicking on bellow button, I agree with ",
                        style: GoogleFonts.inter(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff000000),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Term and conditions.',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //     const RegisterScreen(),
                                //   ),
                                // );
                              },
                            style: GoogleFonts.inter(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xfffc5666),
                            ),
                          ),
                        ],
                      ),
                    ),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        if (newValue != null) {
                          checkedValue = newValue;
                        } else {
                          checkedValue = false;
                        }
                      });
                    }),
                SizedBox(
                  height: screenHeight / 5,
                ),
              ],
            ),
          ),
        ),
      );
  }
}

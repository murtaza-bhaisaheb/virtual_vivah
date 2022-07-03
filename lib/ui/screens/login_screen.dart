import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_vivah/ui/components/vv_text_field.dart';
import 'package:virtual_vivah/ui/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: screenHeight,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: screenHeight / 4,
                      ),
                      SizedBox(
                        height: screenHeight / 3,
                        child: Image.asset(
                          "assets/images/log_in_bg.png",
                          fit: BoxFit.cover,
                          width: screenWidth,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/curve.png",
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight / 28,
                          ),
                          AutoSizeText(
                            "Login to Virtual Vivah",
                            maxLines: 1,
                            style: GoogleFonts.courgette(
                              fontSize: 30.0,
                              color: const Color(0xFFFC5666),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight / 28,
                          ),
                          const VVTextField(
                            label: "User number / email",
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const VVTextField(
                            label: "Password",
                            obscureText: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                child: AutoSizeText(
                                  "Forget Password",
                                  maxLines: 1,
                                  style: GoogleFonts.inter(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xfffc5666),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight / 52,
                          ),
                          loginButton(size, context),
                          SizedBox(
                            height: screenHeight / 18,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Not a member?",
                              style: GoogleFonts.inter(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Register Free',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen(),
                                        ),
                                      );
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
                        ],
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

  GestureDetector loginButton(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      child: Container(
        width: size.width / 1.5,
        height: 54.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 21,
              offset: Offset(0, 7),
            ),
          ],
          border: Border.all(
            color: const Color(0x26000000),
            width: 1,
          ),
        ),
        child: Center(
          child: AutoSizeText(
            "Login",
            maxLines: 1,
            style: GoogleFonts.inter(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

// child: Column(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// // ClipPath(
// //   clipper: ProsteBezierCurve(
// //     position: ClipPosition.bottom,
// //     list: [
// //       BezierCurveSection(
// //         start: const Offset(0, 170),
// //         top: Offset(screenWidth / 16, 140),
// //         end: Offset(screenWidth / 16 * 2, 140),
// //       ),
// //       BezierCurveSection(
// //         start: Offset(screenWidth / 16 * 5, 140),
// //         top: Offset(screenWidth / 16 * 6, 170),
// //         end: Offset(screenWidth / 16 * 8, 140),
// //       ),
// //       BezierCurveSection(
// //         start: Offset(screenWidth / 16 * 10, 150),
// //         top: Offset(screenWidth / 16 * 13, 100),
// //         end: Offset(screenWidth, 170),
// //       ),
// //     ],
// //   ),
// //   child: Container(
// //     height: 170,
// //     decoration: BoxDecoration(
// //       color: Colors.red,
// //       boxShadow: [
// //         BoxShadow(offset: Offset(3,3),),
// //       ]
// //     ),
// //   ),
// // ),
// // ClipPath(
// //   clipper: ProsteBezierCurve(
// //     position: ClipPosition.bottom,
// //     list: [
// //       BezierCurveSection(
// //         start: Offset(screenHeight / 1.5, screenHeight / 1.5),
// //         top: Offset(screenWidth / 16, 140),
// //         end: Offset(screenWidth / 16 * 2, 140),
// //       ),
// //       BezierCurveSection(
// //         start: Offset(screenWidth / 16 * 5, 140),
// //         top: Offset(screenWidth / 16 * 6, 170),
// //         end: Offset(screenWidth / 16 * 8, 140),
// //       ),
// //       BezierCurveSection(
// //         start: Offset(screenWidth / 16 * 10, 150),
// //         top: Offset(screenWidth / 16 * 13, 100),
// //         end: Offset(screenWidth, 170),
// //       ),
// //     ],
// //   ),
// //   child: Container(
// //     height: screenHeight / 1.5,
// //     decoration: BoxDecoration(
// //         color: Colors.red,
// //         boxShadow: [
// //           BoxShadow(offset: Offset(3,3),),
// //         ]
// //     ),
// //   ),
// // ),
// ],
// ),

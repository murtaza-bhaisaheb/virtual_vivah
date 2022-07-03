import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_vivah/ui/components/common_stack.dart';
import 'package:virtual_vivah/ui/components/drop_down_field.dart';

class BasicDetails2Screen extends StatefulWidget {
  const BasicDetails2Screen({Key? key}) : super(key: key);

  @override
  State<BasicDetails2Screen> createState() => _BasicDetails2ScreenState();
}

class _BasicDetails2ScreenState extends State<BasicDetails2Screen> {
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
          screenContent: const CustomWidget(),
          label: 'Basic Details',
          lastScreen: true,
        ),
      ),
    );
  }
}
//
// class CommonStack extends StatelessWidget {
//   const CommonStack({
//     Key? key,
//     required this.screenWidth,
//     required this.screenHeight,
//     required this.screenContent,
//     required this.label,
//     this.lastScreen = false,
//     this.nextScreen,
//   }) : super(key: key);
//
//   final double screenWidth;
//   final double screenHeight;
//   final Widget screenContent;
//   final String label;
//   final bool lastScreen;
//   final Widget? nextScreen;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: Colors.white,
//           body: Stack(
//             alignment: AlignmentDirectional.topCenter,
//             children: [
//               Stack(
//                 alignment: AlignmentDirectional.bottomCenter,
//                 children: [
//                   Stack(
//                     alignment: AlignmentDirectional.topCenter,
//                     children: [
//                       const CustomWidget(),
//                       Container(
//                         color: Colors.white,
//                         width: screenWidth,
//                         padding: EdgeInsets.only(
//                           top: screenHeight / 4,
//                           left: 12.0,
//                           bottom: screenHeight / 28,
//                         ),
//                         child: AutoSizeText(
//                           label,
//                           maxLines: 1,
//                           style: GoogleFonts.inter(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 26.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Stack(
//                 alignment: AlignmentDirectional.bottomCenter,
//                 children: [
//                   Stack(
//                     alignment: AlignmentDirectional.topStart,
//                     children: [
//                       Container(
//                         height: screenHeight / 5,
//                         color: Colors.white,
//                         child: Image.asset(
//                           "assets/images/register_bg.png",
//                           fit: BoxFit.cover,
//                           width: screenWidth,
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsets.symmetric(vertical: screenHeight / 28),
//                         child: Image.asset(
//                           "assets/images/logo.png",
//                           width: screenHeight / 4.5,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Image.asset(
//                     'assets/images/curve.png',
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           child: Container(
//             color: Colors.white,
//             width: screenWidth,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Image.asset(
//                     "assets/images/last.png",
//                     width: screenWidth / 3.5,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     lastScreen ? print("last screen") : Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => nextScreen!,
//                       ),
//                     );
//                   },
//                   child: lastScreen ? Image.asset(
//                     "assets/images/finish.png",
//                     width: screenWidth / 3.5,
//                   ) : Image.asset(
//                     "assets/images/next.png",
//                     width: screenWidth / 3.5,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 3.6,
              left: 24.0,
              right: 24.0,
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: DDFormField(
                        menuItems: [
                          "Self",
                          "Children",
                          "Friend",
                          "Relative",
                        ],
                        label: "Creating profile for",
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: DDFormField(
                        menuItems: [
                          "Self",
                          "Children",
                          "Friend",
                          "Relative",
                        ],
                        label: "Creating profile for",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: DDFormField(
                        menuItems: [
                          "Self",
                          "Children",
                          "Friend",
                          "Relative",
                        ],
                        label: "Creating profile for",
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: DDFormField(
                        menuItems: [
                          "Self",
                          "Children",
                          "Friend",
                          "Relative",
                        ],
                        label: "Creating profile for",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: DDFormField(
                        menuItems: [
                          "Self",
                          "Children",
                          "Friend",
                          "Relative",
                        ],
                        label: "Creating profile for",
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: DDFormField(
                        menuItems: [
                          "Self",
                          "Children",
                          "Friend",
                          "Relative",
                        ],
                        label: "Creating profile for",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: GoogleFonts.inter(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000),
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                    label: const AutoSizeText(
                      "About your relative",
                      maxLines: 1,
                    ),
                    labelStyle: GoogleFonts.inter(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(159, 159, 159, 1),
                    ),
                    floatingLabelStyle: GoogleFonts.inter(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(159, 159, 159, 1),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(252, 86, 102, 1), width: 1.5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(252, 86, 102, 1),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth / 3.5,
                )
              ],
            ),
          ),
        ),
      );
  }
}

// Row(
// children: const [
// Expanded(
// child: DDFormField(
// menuItems: [
// "Self",
// "Children",
// "Friend",
// "Relative",
// ],
// label: "Creating profile for",
// ),
// ),
// SizedBox(
// width: 20.0,
// ),
// Expanded(
// child: DDFormField(
// menuItems: [
// "Self",
// "Children",
// "Friend",
// "Relative",
// ],
// label: "Creating profile for",
// ),
// ),
// ],
// ),
// SizedBox(
// height: screenHeight / 64.0,
// ),

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonStack extends StatefulWidget {
  const CommonStack({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.screenContent,
    required this.label,
    this.lastScreen = false,
    this.nextScreen,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  final Widget screenContent;
  final String label;
  final bool lastScreen;
  final Widget? nextScreen;

  @override
  State<CommonStack> createState() => _CommonStackState();
}

class _CommonStackState extends State<CommonStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      widget.screenContent,
                      Container(
                        color: Colors.white,
                        width: widget.screenWidth,
                        padding: EdgeInsets.only(
                          top: widget.screenHeight / 5,
                          left: 24.0,
                          bottom: widget.screenHeight / 30,
                        ),
                        child: AutoSizeText(
                          widget.label,
                          maxLines: 1,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Container(
                        height: widget.screenHeight / 5.5,
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/register_bg.png",
                          fit: BoxFit.cover,
                          width: widget.screenWidth,
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: widget.screenHeight / 28),
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: widget.screenHeight / 6,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/curve.png',
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.white,
            width: widget.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/images/last.png",
                    width: widget.screenWidth / 3.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.lastScreen ? print("last screen") : Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => widget.nextScreen!,
                      ),
                    );
                  },
                  child: widget.lastScreen ? Image.asset(
                    "assets/images/finish.png",
                    width: widget.screenWidth / 3.5,
                  ) : Image.asset(
                    "assets/images/next.png",
                    width: widget.screenWidth / 3.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
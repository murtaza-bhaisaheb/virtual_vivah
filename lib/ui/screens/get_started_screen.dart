import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_vivah/ui/screens/login_screen.dart';
import 'package:virtual_vivah/ui/screens/register_screen.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset(
              "assets/images/cover.png",
              fit: BoxFit.fitWidth,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: size.shortestSide / 1.5,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height / 12,
                    bottom: size.height / 36.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Let's get started",
                        maxLines: 3,
                        style: GoogleFonts.courgette(
                            fontSize: 28.0, color: const Color(0xFFFC5666)),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "India’s first Matrimonial Virtual Meeting App",
                        maxLines: 5,
                        style: GoogleFonts.inter(fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                loginButton(size, context),
                SizedBox(
                  height: size.height / 40.0,
                ),
                createAccountButton(size, context),
                SizedBox(
                  height: size.height / 20.0,
                ),
              ],
            ),
          ],
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
          borderRadius: const BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
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

  GestureDetector createAccountButton(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
      },
      child: Container(
        width: size.width / 1.5,
        height: 54.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1c000000),
              offset: Offset(0, 7),
              blurRadius: 22,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          border: Border(
            top: BorderSide(
              color: Colors.transparent,
              width: 0.7,
            ),
            left: BorderSide(
              color: Colors.transparent,
              width: 0.7,
            ),
            bottom: BorderSide(
              color: Colors.transparent,
              width: 0.7,
            ),
            right: BorderSide(
              color: Colors.transparent,
              width: 0.7,
            ),
          ),
        ),
        child: Center(
          child: AutoSizeText(
            "Create an Account",
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

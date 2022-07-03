import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:virtual_vivah/ui/components/common_stack.dart';
import 'package:virtual_vivah/ui/screens/basic_details2.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
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
          screenContent: const VerifyOTPWidget(
            number: '+91 8487996556',
          ),
          label: "Verify OTP",
          nextScreen: const BasicDetails2Screen(),
        ),
      ),
    );
  }
}

class VerifyOTPWidget extends StatefulWidget {
  const VerifyOTPWidget({Key? key, required this.number}) : super(key: key);
  final String number;

  @override
  State<VerifyOTPWidget> createState() => _VerifyOTPWidgetState();
}

class _VerifyOTPWidgetState extends State<VerifyOTPWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final number = widget.number;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: "Enter the OTP sent on $number ",
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff000000),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'change number?',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pop();
                        },
                      style: GoogleFonts.inter(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xfffc5666),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: screenHeight / 28.0,
              ),
              OTPTextField(
                length: 4,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                width: MediaQuery.of(context).size.width,
                fieldWidth: 60,
                style: GoogleFonts.inter(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                ),
                otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: const Color(0xFFFC5666),
                  focusBorderColor: const Color(0xFFFC5666),
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
// fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
//TODO: Implement on complete method
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Please, enter 4-digit code we sent on your number as SMS",
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9F9F9F),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              RichText(
                text: TextSpan(
                  text: "If not sent ",
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF908F9D),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Send Again',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
//TODO: Implement Send Again Method
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
              SizedBox(
                height: screenHeight / 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_vivah/models/age_model.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({
    Key? key,
    required this.labelOne,
    required this.labelTwo,
    required this.imageOne,
    required this.imageTwo,
  }) : super(key: key);
  final String labelOne;
  final String labelTwo;
  final Widget imageOne;
  final Widget imageTwo;

  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => setState(
                () {
                  _value = 0;
                  Age(isMale: true).minAge();
                },
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _value == 0
                      ? const Color.fromRGBO(252, 86, 102, 0.05)
                      : Colors.transparent,
                  border: Border.all(
                    color: _value == 0
                        ? const Color.fromRGBO(252, 86, 102, 1)
                        : Colors.grey,
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: MediaQuery.of(context).size.height / 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.imageOne,
                    AutoSizeText(
                      widget.labelOne,
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _value = 1),
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _value == 1
                      ? const Color.fromRGBO(252, 86, 102, 0.05)
                      : Colors.transparent,
                  border: Border.all(
                    color: _value == 1
                        ? const Color.fromRGBO(252, 86, 102, 1)
                        : Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.imageTwo,
                    AutoSizeText(
                      widget.labelTwo,
                      maxLines: 1,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

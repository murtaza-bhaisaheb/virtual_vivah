import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtual_vivah/ui/components/common_stack.dart';
import 'package:virtual_vivah/ui/components/drop_down_field.dart';
import 'package:virtual_vivah/ui/components/radio_buttons.dart';
import 'package:virtual_vivah/ui/components/vv_text_field.dart';
import 'package:virtual_vivah/ui/screens/basic_details_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          screenContent: const RegisterColumnWidget(),
          label: "Register to begin",
          nextScreen: const BasicDetailsScreen(),
        ),
      ),
    );
  }
}

class RegisterColumnWidget extends StatefulWidget {
  const RegisterColumnWidget({Key? key}) : super(key: key);

  @override
  State<RegisterColumnWidget> createState() => _RegisterColumnWidgetState();
}

class _RegisterColumnWidgetState extends State<RegisterColumnWidget> {

  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController _textEditingController = TextEditingController();

    DateTime _selectedDate = DateTime(2001);

    Future<void> _selectDate(BuildContext context) async {
      DateTime? newSelectedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2040),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  surface: Colors.blueGrey,
                  onSurface: Colors.yellow,
                ),
                dialogBackgroundColor: Colors.blue[500],
              ),
              child: child!,
            );
          });

      if (newSelectedDate != null) {
        _selectedDate = newSelectedDate;
        _textEditingController
          ..text = DateFormat.yMMMd().format(_selectedDate)
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: _textEditingController.text.length,
              affinity: TextAffinity.upstream));
      }
    }

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
              const DDFormField(
                menuItems: [
                  "Self",
                  "Children",
                  "Friend",
                  "Relative",
                ],
                label: "Creating profile for",
              ),
              const SizedBox(
                height: 20.0,
              ),
              const DDFormField(
                menuItems: [
                  "Never Married",
                  "Awaiting Divorce",
                  "Divorce",
                  "Widowed",
                  "Annulled",
                ],
                label: "Marital Status",
              ),
              const SizedBox(
                height: 20.0,
              ),
              RadioButtons(
                labelOne: 'Male',
                imageOne: Column(
                  children: [
                    const Spacer(),
                    Image.asset("assets/images/man.png"),
                  ],
                ),
                imageTwo: Column(
                  children: [
                    const Spacer(),
                    Image.asset("assets/images/fem.png"),
                  ],
                ),
                labelTwo: 'Female',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: const [
                  Expanded(
                    child: VVTextField(
                      label: 'First name',
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: VVTextField(
                      label: 'Last name',
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const VVTextField(
                label: 'Birth date',
                obscureText: false,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const VVTextField(
                label: 'Email',
                obscureText: false,
                textType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const VVTextField(
                label: 'Password',
                obscureText: false,
                textType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: screenWidth / 3.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

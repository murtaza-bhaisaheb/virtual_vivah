import 'dart:convert';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:virtual_vivah/ui/components/common_stack.dart';
import 'package:virtual_vivah/ui/components/drop_down_field.dart';
import 'package:virtual_vivah/ui/screens/complete_profile.dart';
import 'package:http/http.dart' as http;

class BasicDetailsScreen extends StatefulWidget {
  const BasicDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BasicDetailsScreen> createState() => _BasicDetailsScreenState();
}

class _BasicDetailsScreenState extends State<BasicDetailsScreen> {
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
          screenContent: const BasicDetailsColumnWidget(),
          label: 'Basic Details',
          nextScreen: const CompleteProfileScreen(),
        ),
      ),
    );
  }
}

class BasicDetailsColumnWidget extends StatefulWidget {
  const BasicDetailsColumnWidget({Key? key}) : super(key: key);

  @override
  State<BasicDetailsColumnWidget> createState() => _BasicDetailsColumnWidgetState();
}

class _BasicDetailsColumnWidgetState extends State<BasicDetailsColumnWidget> {
  List _items = [];
  static const List<String> heights = [
    "4",
    "4.1",
    "4.2",
    "4.3",
    "4.4",
    "4.5",
    "4.6",
    "4.7",
    "4.8",
    "4.9",
    "5",
    "5.1",
    "5.2",
    "5.3",
    "5.4",
    "5.5",
    "5.6",
    "5.7",
    "5.8",
    "5.9",
    "6",
    "6.1",
    "6.2",
    "6.3",
    "6.4",
    "6.5",
    "6.6",
    "6.7",
    "6.8",
    "6.9",
    "7",
  ];

  List<dynamic> countryList = [];

  Future<void> readJSON() async {
    final res = await http
        .get(
      Uri.parse('https://www.virtualvivah.in/testing/csc.json'),
    )
        .then((res) {
      var data = jsonDecode(res.body);
      setState(() {
        countryList = data.csc;
      });
    });
    print(countryList.length);
    // final data = await json.decode(res);
    // setState((){
    //   _items = data["csc"];
    // });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String? countryValue;
    String? stateValue;
    String? cityValue;
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
                    "Hindu",
                  ],
                  label: "Religion",
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                // TextButton(onPressed: (){
                //   readJSON().then((value) {
                //     print(_items);
                //   });
                // }, child: const Text("Press")),
                DropdownButtonHideUnderline(
                  child: SelectState(
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const DDFormField(
                  menuItems: heights,
                  label: "Height (in feet)",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const DDFormField(
                  menuItems: [
                    "Joint Family",
                    "Nuclear Family",
                    "Others",
                  ],
                  label: "Family Type",
                ),
                const SizedBox(
                  height: 20.0,
                ),

                const DDFormField(
                  menuItems: [
                    "None",
                    "Mentally challenged",
                    "Serious disease",
                    "Physically challenged",
                  ],
                  label: "Any disability",
                ),
                SizedBox(
                  height: screenHeight / 64.0,
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
                SizedBox(
                  height: screenHeight / 64.0,
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
                SizedBox(
                  height: screenHeight / 64.0,
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
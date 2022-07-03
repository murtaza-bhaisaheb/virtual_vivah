import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key, required this.items}) : super(key: key);
  final List<String> items;

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final List<String> items = widget.items;
    return DropdownButton2(
      hint: Text(
        'Creating Account For',
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).hintColor,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value as String;
        });
      },
      underline: Container(
        height: 2,
        color: Colors.pink, //<-- SEE HERE
      ),
      buttonHeight: 60,
      buttonWidth: MediaQuery.of(context).size.width - 40,
      itemHeight: 40,
    );
  }
}

class DDFormField extends StatefulWidget {
  const DDFormField({
    Key? key,
    required this.label,
    required this.menuItems,
  }) : super(key: key);

  final String label;
  final List<String> menuItems;

  @override
  State<DDFormField> createState() => _DDFormFieldState();
}

class _DDFormFieldState extends State<DDFormField> {
  String? _category;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),
      items: widget.menuItems.map((String category) {
        return DropdownMenuItem(value: category, child: Text(category));
      }).toList(),
      onChanged: (newValue) {
        // do other stuff with _category
        setState(
          () => _category = newValue.toString(),
        );
      },
      value: _category,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        suffixIcon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black54,
          size: 24.0,
        ),
        isDense: true,
        filled: true,

        label: AutoSizeText(
          widget.label,
          maxLines: 2,
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 16.0,
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
          width: 1.5,
          color: Color.fromRGBO(252, 86, 102, 1),
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          width: 1.5,
          color: Color.fromRGBO(252, 86, 102, 1),
        )),
        fillColor: Colors.white,
        // hintText: Localization.of(context).category,
        // errorText: errorSnapshot.data == 0
        //     ? Localization.of(context).categoryEmpty
        //     : null,
      ),
    );
  }
}

class DDButton extends StatefulWidget {
  const DDButton({Key? key}) : super(key: key);

  @override
  State<DDButton> createState() => _DDButtonState();
}

class _DDButtonState extends State<DDButton> {
  // List<DropdowmMenuItem> item;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: ["a", "b", "c"].map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value as String;
        });
      },
    );
  }
}

// class DropdownButton2 extends StatefulWidget {
//   const DropdownButton2({Key? key}) : super(key: key);
//
//   @override
//   _DropdownButton2State createState() => _DropdownButton2State();
// }
//
// class _DropdownButton2State extends State<DropdownButton2> {
//   @override
//
//   final List<String> items = [
//     'Single',
//     'Divorced',
//   ];
//   String? selectedValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton2(
//       hint: Text(
//         'Maritial Status',
//         style: TextStyle(
//           fontSize: 18,
//           color: Theme.of(context).hintColor,
//         ),
//       ),
//       items: items
//           .map((item) => DropdownMenuItem<String>(
//         value: item,
//         child: Text(
//           item,
//           style: const TextStyle(
//             fontSize: 14,
//           ),
//         ),
//       ))
//           .toList(),
//       value: selectedValue,
//       onChanged: (value) {
//         setState(() {
//           selectedValue = value as String;
//         });
//       },
//       underline: Container(
//         height: 2,
//         color: Colors.pink, //<-- SEE HERE
//       ),
//       buttonHeight: 60,
//       buttonWidth: MediaQuery.of(context).size.width - 40,
//       itemHeight: 40,
//     );
//   }
// }

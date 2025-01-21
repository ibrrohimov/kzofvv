// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:seysmoprognoz/core/config/extensions.dart';
// import 'package:seysmoprognoz/core/config/input_styles.dart';

// class AppDropdown extends StatelessWidget {
//   final List<String> items;
//   final String topLabel;
//   const AppDropdown({
//     super.key,
//     required this.items,
//     required this.topLabel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 5),
//           child: Text(
//             topLabel,
//             style: context.regular20,
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Color.fromARGB(29, 0, 0, 0).withOpacity(0.05),
//                 spreadRadius: 0,
//                 blurRadius: 20,
//                 offset: Offset(0, 4), // changes position of shadow
//               ),
//             ],
//           ),
//           child: DropdownButtonFormField2<String>(
//             isExpanded: true,
//             decoration: InputDecoration(
//               contentPadding: const EdgeInsets.symmetric(vertical: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide: BorderSide(color: context.greyScale5),
//               ),
//               enabledBorder: enabledBorderStyle,
//               focusedBorder: focusedBorderStyle,
//               // Add more decoration..
//             ),
//             items: items
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: context.regular18,
//                       ),
//                     ))
//                 .toList(),
//             validator: (value) {
//               if (value == null) {
//                 return 'Please select gender.';
//               }
//               return null;
//             },
//             onChanged: (value) {
//               //Do something when selected item is changed.
//             },
//             onSaved: (value) {
//               // selectedValue = value.toString();
//             },
//             buttonStyleData: const ButtonStyleData(
//               padding: EdgeInsets.only(right: 8),
//             ),
//             iconStyleData: const IconStyleData(
//               icon: Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Colors.black45,
//               ),
//               iconSize: 24,
//             ),
//             dropdownStyleData: DropdownStyleData(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   border: Border.all(color: context.greyScale7)),
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

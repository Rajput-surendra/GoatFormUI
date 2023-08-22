// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import '../Helper/AppBtn.dart';
// import '../Helper/Colors.dart';
// import '../Helper/customText.dart';
// import '../Helper/custom_textFormField.dart';
// import '../helper/appbar.dart';
//
// class suppliment_consume extends StatefulWidget {
//   const suppliment_consume({Key? key}) : super(key: key);
//
//   @override
//   State<suppliment_consume> createState() => _suppliment_consumeState();
// }
//
// class _suppliment_consumeState extends State<suppliment_consume> {
//   String? Categorirs;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:colors.grad1Color,
//       appBar: customAppBar(context: context, text:"Suppliment Consume ", isTrue: true, ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Custom_Text(text: 'Categories'),
//               SizedBox(height: 8,),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.white,
//                 child: DropdownButton2<String>(
//                   isExpanded: true,
//                   value:Categorirs,
//                   //elevation: 5,
//                   style: TextStyle(color: Colors.black87),
//
//                   items: <String>[
//                     'Cows',
//                     'Chickens',
//                     'Pigs',
//                     'Goat',
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//
//                   hint: Text(
//                     "Select Category",
//                   ),
//                   onChanged: (String? value)  {
//                     setState(() {
//                       Categorirs = value!;
//                     });
//                   },
//                   // icon: Icon(  // Add a custom icon here
//                   //   Icons.arrow_drop_down,  // Replace this with the desired icon
//                   //   color: Colors.black87, // Customize the icon color
//                   // ),
//
//                   underline: Container(  // Use a container with zero height to remove the underline
//                     height: 0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15,),
//               Custom_Text(text: 'Selected type'),
//               SizedBox(height: 8,),
//               Container(
//                 width: MediaQuery.of(context).size
//                     .width,
//                 color: Colors.white,
//                 child: TextFormField(
//                     cursorHeight: 25,
//                     decoration: InputDecoration(
//                       suffixIcon: Icon(Icons.document_scanner_sharp),
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.all(10),
//                     )
//                 ),
//               ),
//               SizedBox(height: 15,),
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Custom_Text(text: 'Total Kids'),
//                       SizedBox(height: 8,),
//                       Container(
//                         width: MediaQuery.of(context).size.width/2.3,
//                         color: Colors.white,
//                         // child: CustomTextFormField(hintText: '',),
//                       )
//                     ],
//                   ),
//                   SizedBox(width: 5,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Custom_Text(text: 'Total Weight'),
//                       SizedBox(height: 8,),
//                       Container(
//                         width: MediaQuery.of(context).size.width/2.3,
//                         color: Colors.white,
//                         // child: CustomTextFormField(hintText: '',),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15,),
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Custom_Text(text: 'Supplement ID'),
//                       SizedBox(height: 8,),
//                       Container(
//                         width: MediaQuery.of(context).size.width/2.3,
//                         color: Colors.white,
//                         child: CustomTextFormField(hintText: '',),
//                       )
//                     ],
//                   ),
//                   SizedBox(width: 5,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Custom_Text(text: 'Scan Supplement'),
//                       SizedBox(height: 8,),
//                       Container(
//                         width: MediaQuery.of(context).size.width/2.3,
//                         color: Colors.white,
//                         child: CustomTextFormField(hintText: '',),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15,),
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Custom_Text(text: 'Supplement Required'),
//                       SizedBox(height: 8,),
//                       Container(
//                         width: MediaQuery.of(context).size.width/2.3,
//                         color: Colors.white,
//                         child: CustomTextFormField(hintText: '',),
//                       )
//                     ],
//                   ),
//                   SizedBox(width: 5,),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Custom_Text(text: 'Enter Weight'),
//                       SizedBox(height: 8,),
//                       Container(
//                         width: MediaQuery.of(context).size.width/2.3,
//                         color: Colors.white,
//                         child: CustomTextFormField(hintText: '',),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15,),
//               Custom_Text(text: 'Remark'),
//               SizedBox(height: 8,),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.white,
//                 child: CustomTextFormField(hintText: '',),
//               ),
//               SizedBox(height: 100,),
//
//               Btn(title: 'Save',height: 60,width: MediaQuery.of(context).size.width,)
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

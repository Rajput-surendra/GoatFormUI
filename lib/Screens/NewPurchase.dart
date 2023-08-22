import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Helper/session.dart';
import '../Utils/Colors.dart';
import 'TextFormCard.dart';

class NewPurchase extends StatefulWidget {
  const NewPurchase({Key? key}) : super(key: key);

  @override
  State<NewPurchase> createState() => _NewPurchaseState();
}

class _NewPurchaseState extends State<NewPurchase> {
   final _formKey =GlobalKey<FormState>();

  TextEditingController invoiceController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController partyNameController=TextEditingController();
  TextEditingController purchaseCatController=TextEditingController();
  TextEditingController materialDesController=TextEditingController();
  TextEditingController qtyController=TextEditingController();
  TextEditingController purchasePartyController=TextEditingController();
  TextEditingController imageController=TextEditingController();
  TextEditingController purchasePriceController=TextEditingController();
  TextEditingController RemarkController=TextEditingController();
  TextEditingController mobileController=TextEditingController();

  File? selectedImage;
  Future<void> _showImageSourceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Image Source'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickImage(ImageSource.gallery);
              },
              child: Text('Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickImage(ImageSource.camera);
              },
              child: Text('Camera'),
            ),
          ],
        );
      },
    );
  }
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 50, // You can adjust the image quality here
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path) ;
      });
      print("${selectedImage}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context: context, text:"${getTranslated(context, "NEW_PURCHASE")}", isTrue: true, ),
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       TextFormCard(
                         name:"${getTranslated(context, "INVOICE_NO")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: invoiceController,
                         validString: getTranslated(context, "INVOICE_NO"),
                       ),
                       TextFormCard(
                         name:"${getTranslated(context, "DATE")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: dateController,
                         validString:getTranslated(context, "DATE"),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       TextFormCard(
                         name:"${getTranslated(context, "PARTY_NAME")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: partyNameController,
                         validString:getTranslated(context, "PARTY_NAME"),

                       ),
                       TextFormCard(
                         name:"${getTranslated(context, "MOBILE_NO.")}" ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: mobileController,
                         validString:getTranslated(context, "MOBILE_NO."),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       TextFormCard(
                         name:getTranslated(context, "PURCHASE_CATEGORY") ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: purchaseCatController,
                         validString: getTranslated(context, "PURCHASE_CATEGORY"),
                       ),
                       TextFormCard(
                         name:getTranslated(context, "MATERIAL_DESCRIPTION") ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: materialDesController,
                         validString: getTranslated(context, "MATERIAL_DESCRIPTION"),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       TextFormCard(
                         name:getTranslated(context, "QTY") ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: qtyController,
                         validString:getTranslated(context, "QTY"),
                       ),
                       TextFormCard(
                         name:getTranslated(context, "PURCHASE_PRICE") ,
                         width: MediaQuery.of(context).size.width/2.3,
                         controller: purchasePriceController,
                         validString: getTranslated(context, "PURCHASE_PRICE"),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         margin:EdgeInsets.only(left: 7) ,
                         child: Text(
                           getTranslated(context, "IMAGE"),
                           style: TextStyle(
                               color: Colors.black.withOpacity(0.5),
                               fontSize: 13
                           ),
                         ),
                       ),
                       SizedBox(height: 5,),
                       Card(
                         elevation: 1,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5),
                         ),
                         child: GestureDetector(
                           onTap: (){
                             _showImageSourceDialog(context);
                           },
                           child: Container(
                               width: MediaQuery.of(context).size.width,
                               height: 46,

                               color: Colors.white,
                               alignment: Alignment.center,
                               child:(selectedImage!=null)?Text('$selectedImage',overflow: TextOverflow.ellipsis,):Text("+")
                           ),
                         ),
                       )
                     ],
                   ),
                   SizedBox(height: 10,),
                   TextFormCard(
                     name:getTranslated(context, "REMARK") ,
                     width: MediaQuery.of(context).size.width,
                     controller: RemarkController,
                     validString: getTranslated(context, "PURCHASE_PRICE"),
                   ),
                   SizedBox(height: 60,),

                   Btn(
                     title:getTranslated(context, "SAVE"),
                     height: MediaQuery.of(context).size.width/8,
                     width:MediaQuery.of(context).size.width/1.2 ,
                     onPress:(){
                       if(_formKey.currentState!.validate()){
                         if(selectedImage==null){
                           "Image is required";
                         }else{
                           Navigator.pop(context);
                         }
                       }

                     },
                   ),


                 ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

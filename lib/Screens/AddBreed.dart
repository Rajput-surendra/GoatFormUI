import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madhu_farma/Helper/Colors.dart';

import '../ApiPath/Api.dart';
import '../Helper/AppBtn.dart';
import '../Helper/Appbar.dart';
import '../Helper/session.dart';
import '../Model/animal_cat_model_response.dart';
// import '../Utils/Colors.dart';

class AddBreed extends StatefulWidget {
  const AddBreed({Key? key}) : super(key: key);

  @override
  State<AddBreed> createState() => _AddBreedState();
}

class _AddBreedState extends State<AddBreed> {
  String dropdownValue = 'Goat';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
  }
  TextEditingController periodController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController mattingController=TextEditingController();
  TextEditingController onwardsController=TextEditingController();
  final _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar:customAppBar(context: context, text:'${getTranslated(context, "ADD_BREED")}', isTrue: true, ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('${getTranslated(context, "CATEGORIES")}'),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Card(

                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<AnimalCatList>(
                          hint:  Text(getTranslated(context, "SELECT_CATE"),
                            style: TextStyle(
                                color: colors.black54,fontWeight: FontWeight.w500,fontSize:15
                            ),),
                          value: animalCat,
                          icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.secondary,size: 30,),
                          style:  const TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                          underline: Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0),
                            child: Container(

                              // height: 2,
                              color:  colors.whiteTemp,
                            ),
                          ),
                          onChanged: (AnimalCatList? value) {
                            setState(() {
                              animalCat = value!;
                              catId =  animalCat?.id;
                             // animalCountApi(animalCat!.id);
                            });
                          },
                          items: animalCatResponse?.data?.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Container(

                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 0),
                                          child: Text(items.name.toString(),overflow:TextOverflow.ellipsis,style: const TextStyle(color:colors.black54),),
                                        )),
                                  ),

                                ],
                              ),
                            );
                          })
                              .toList(),
                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('${getTranslated(context, "GESTATION_NAME")}'),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 4,
                  child:  Container(
                    child:TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),

                Text('${getTranslated(context, "GESTATION_PERIOD")}'),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 4,
                  child:  Container(
                    child:TextFormField(
                      controller: periodController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Gestation Period';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('1st ${getTranslated(context, "MATTING")}'),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 4,
                  child:  Container(
                    child:TextFormField(
                     controller: mattingController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter 1st matting';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('2nd ${getTranslated(context, "ONWARDS")}'),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 4,
                  child: Container(
                    child:TextFormField(
                       controller: onwardsController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter 2nd onwards';
                        }
                        return null;
                      },
                    ),
                  ),),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:EdgeInsets.only(left: 7) ,
                      child: Text(
                        getTranslated(context, "IMAGE"),

                      ),
                    ),
                    SizedBox(height: 5,),
                    Card(
                      elevation: 4,

                      child: GestureDetector(
                        onTap: (){
                          _showImageSourceDialog(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                            width: MediaQuery.of(context).size.width,
                            height: 50,

                            alignment: Alignment.center,
                            child:(selectedImage!=null)?Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text('$selectedImage',overflow: TextOverflow.ellipsis,),
                            ):Text("+")
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      bottomSheet:Padding(

        padding: const EdgeInsets.all(8.0),
        child: Btn(
          title:getTranslated(context, "SAVE"),
          height: MediaQuery.of(context).size.height/8,
          width:MediaQuery.of(context).size.width/1.0 ,
          onPress:(){
            if(_formKey.currentState!.validate()){
               addPurchaseApi();
              // if(selectedImage!.path.isNotEmpty){
              //
              //   Fluttertoast.showToast(msg: "Image is required");
              // }else{
              //
              // }
            }

          },
        ),
      ),
    );
  }
  bool isLoading=false;
  Future<void> addPurchaseApi() async {
    setState(() {
      isLoading = true;
    });
    Map<String,String> parameter = {
      'category': catId.toString(),
      'name': nameController.text,
      'gestation_period':periodController.text,
      'first_matting': mattingController.text,
      'second_onwards': onwardsController.text
    };
    apiBaseHelper.postMultipartAPICall(Uri.parse(ApiService.addBreed), parameter, fileKey: 'image', files: selectedImageList).then((getData) {
      bool error = getData['error'];
      if (error == false) {
        Fluttertoast.showToast(msg: "${getData['message']}");
        Navigator.pop(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;

      }
      setState(() {
        isLoading = false;
      });
    });
  }



  String? catId;
  AnimalCatList? animalCat;
  AnimalCatResponse? animalCatResponse;
  Future<void> animalCatApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.animalCategory)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        animalCatResponse = AnimalCatResponse.fromJson(getData);
        setState(() {});
      }
    });
  }
  File? selectedImage;
  List <File> selectedImageList = [];
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
        selectedImageList.add(selectedImage ?? File(''));
      });
      print("${selectedImage}");
    }
  }
}
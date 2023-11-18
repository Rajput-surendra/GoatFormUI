import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';


import '../ApiPath/Api.dart';
import '../Helper/AppBtn.dart';
import '../Helper/CustomText.dart';
import '../Helper/session.dart';
import '../Model/animal_cat_model_response.dart';
import '../Model/breed_list_model.dart';
import '../Record/AnimalRecord.dart';
import '../Utils/Colors.dart';
import '../helper/appbar.dart';

class AddNewAnimal extends StatefulWidget {
  const AddNewAnimal({Key? key}) : super(key: key);

  @override
  State<AddNewAnimal> createState() => _AddNewAnimalState();
}

class _AddNewAnimalState extends State<AddNewAnimal> {

  String _btn='Breeder';
  String _btn2='yes';
  int weight=35;
  int sale=450;
  int breederIndex=1;
  int kurbaniIndex=0;
  int cuttingIndex=0;
  int yesIndex=1;
  int noIndex=0;
  String? userType;
  String? breed;
  String?gender;
  String? born;
  TextEditingController brithDateCtr = TextEditingController();
  String? selectedBirthDate;
  TextEditingController purchaseDateCtr = TextEditingController();
  String? selectedPurchaseDate;
  File? image;
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
    }
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
    breedListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: "${getTranslated(context, "ADD_NEW_RECORD")}",
        isTrue: true,
      ),
      backgroundColor:colors.grad1Color,
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "CATEGORIES")}'),
                        SizedBox(height: 8,),
                        Container(
                          height: 60,
                          width: 160,
                          child: Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(5)
                            // ),
                            //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<AnimalCatList>(
                                  hint:  Text(getTranslated(context, "SELECT_CATE"),
                                    style: TextStyle(
                                        color: colors.black54,fontWeight: FontWeight.w500,fontSize:12
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

                                      //animalCountApi(animalCat!.id);
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom_Text(text: '${getTranslated(context, "BREED")}'),
                        SizedBox(height: 8,),
                        Container(
                          width: 160,
                          height: 60,
                          child: Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(5)
                            // ),
                            //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<BreedDataList>(
                                  hint:  Text(getTranslated(context, "BREED"),
                                    style: TextStyle(
                                        color: colors.black54,fontWeight: FontWeight.w500,fontSize:12
                                    ),),
                                  value: animalBreed,
                                  icon:  Icon(Icons.keyboard_arrow_down_rounded,  color:colors.secondary,size: 30,),
                                  style:  const TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                                  underline: Padding(
                                    padding: const EdgeInsets.only(left: 0,right: 0),
                                    child: Container(

                                      // height: 2,
                                      color:  colors.whiteTemp,
                                    ),
                                  ),
                                  onChanged: (BreedDataList? value) {
                                    setState(() {
                                      animalBreed = value!;
                                      catId =  animalBreed?.id;

                                      //animalCountApi(animalCat!.id);
                                    });
                                  },
                                  items: breedListModel?.data?.map((items) {
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
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "TAG_ID")}'),
                      SizedBox(height: 8,),
                      Container(
                          width: MediaQuery.of(context).size.width/2.3,
                          color: Colors.white,
                          child:TextFormField(
                            decoration: InputDecoration(
                                hintText: "${getTranslated(context, "SCAN_ENTER")}",
                                suffixIcon: Container(
                                  height: 7,
                                  width: 7,
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset("assets/images/Group 72309.png"),
                                ),
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "GENDER")}'),
                      SizedBox(height: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        color: Colors.white,
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          value:gender,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black87),

                          items: <String>[
                            '${getTranslated(context, "MALE")}',
                            '${getTranslated(context, "FEMALE")}',
                            '${getTranslated(context, "OTHER")}'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          icon: Icon(Icons.keyboard_arrow_down),
                          hint: Text(
                            "${getTranslated(context, "GENDER")}",
                          ),
                          onChanged: (String? value)  {
                            setState(() {
                              gender = value!;
                            });
                          },

                          underline: Container(  // Use a container with zero height to remove the underline
                            height: 0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(text: '${getTranslated(context, "PROCUREMENT")}'),
                  SizedBox(height: 8,),
                  Container(
                    // width: MediaQuery.of(context).size.width/2.3,
                    color: Colors.white,
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      value:born,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black87),

                      items: <String>[
                        'Born at Farm',
                        'Born another place'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      icon: Icon(Icons.keyboard_arrow_down),
                      hint: Text(
                        "Where Born",
                      ),
                      onChanged: (String? value)  {
                        setState(() {
                          born = value!;
                        });
                      },

                      underline: Container(  // Use a container with zero height to remove the underline
                        height: 0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "BIRTH_DATE")}'),
                      SizedBox(height: 8,),
                      GestureDetector(
                          onTap: () async {
                            DateTime? datePicked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2024));
                            if (datePicked != null) {
                              print(
                                  'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                              String formettedDate =
                              DateFormat('dd-MM-yyyy').format(datePicked);
                              setState(() {
                                selectedBirthDate = formettedDate;
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            color: Colors.white,
                            child:  TextFormField(

                              onTap:
                                  () async{
                                DateTime? datePicked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2024));
                                if (datePicked != null) {
                                  print(
                                      'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                  String formettedDate =
                                  DateFormat('dd-MM-yyyy').format(datePicked);
                                  setState(() {
                                    selectedBirthDate = formettedDate;
                                    brithDateCtr.text = formettedDate;
                                  });
                                }
                              },
                              controller: brithDateCtr,
                              decoration: InputDecoration(
                                border:InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'dd-mm-yyyy',
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value){
                                if(value==null||value.isEmpty)
                                  return "Please Enter Date and time";
                                return null;
                              },
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "BIRTH_WEIGHT")}'),
                      SizedBox(height: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        color: Colors.white,
                        child: CustomTextFormField(hintText: '',),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "MOTHER_ID")}'),
                      SizedBox(height: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        color: Colors.white,
                        child: CustomTextFormField(hintText: '',),
                      )
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context,"FATHER_ID")}'),
                      SizedBox(height: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        color: Colors.white,
                        child: CustomTextFormField(hintText: '',),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "PURCHASE_DATE")}'),
                      SizedBox(height: 8,),
                      GestureDetector(
                          onTap: () async {
                            DateTime? datePicked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2024));
                            if (datePicked != null) {
                              print(
                                  'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                              String formettedDate =
                              DateFormat('dd-MM-yyyy').format(datePicked);
                              setState(() {
                                selectedPurchaseDate = formettedDate;
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.3,
                            color: Colors.white,
                            child:  TextFormField(

                              onTap:
                                  () async{
                                DateTime? datePicked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2024));
                                if (datePicked != null) {
                                  print(
                                      'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                  String formettedDate =
                                  DateFormat('dd-MM-yyyy').format(datePicked);
                                  setState(() {
                                    selectedPurchaseDate= formettedDate;
                                    purchaseDateCtr.text = formettedDate;
                                  });
                                }
                              },
                              controller: purchaseDateCtr,
                              decoration: InputDecoration(
                                border:InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'dd-mm-yyyy',
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value){
                                if(value==null||value.isEmpty)
                                  return "Please Enter Date and time";
                                return null;
                              },
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "AGE")}'),
                      SizedBox(height: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        color: Colors.white,
                        child: CustomTextFormField(hintText: '',),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "WEIGHT")}'),
                      SizedBox(height: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        color: Colors.white,
                        child: CustomTextFormField(hintText: '',),
                      )
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: '${getTranslated(context, "PHOTO")}'),
                      SizedBox(height: 8,),
                      Container(
                        width: MediaQuery.of(context).size.width/2.3,
                        // height: ,
                        color: Colors.white,
                        child:  GestureDetector(
                          onTap:(){ _showImageSourceDialog(context);},
                          child: Padding(padding: EdgeInsets.only(top: 15,right: 8,bottom: 15,left: 15),

                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  if(selectedImage==null)
                                    Text('${getTranslated(context, "IMAGE")}')
                                  else if(selectedImage != null)
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/2.8,
                                      child: Text('$selectedImage',overflow: TextOverflow.ellipsis,),),

                                ],
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Custom_Text(text: '${getTranslated(context, "IF_PREGNANT_:_EXPECTED_DELIVERY_DUE_DATE")}'),
                  SizedBox(height: 8,),
                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    color: Colors.white,
                    child: CustomTextFormField(hintText: '',),
                  )
                ],
              ),

              SizedBox(height: 15,),
              Text('${getTranslated(context, "IF_MALE_SELECT_TYPE")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                  Row(
                    children: [
                      Radio(value:'${getTranslated(context, "BREEDER")}', groupValue: _btn,

                          activeColor: (breederIndex==1)?Color(0xff002E77):Colors.grey,
                          fillColor: MaterialStateColor.resolveWith((states) => (breederIndex==1)?Color(0xff002E77):Colors.grey ),
                          onChanged:(value){
                            setState(() {
                              _btn=value.toString();
                              breederIndex=1;
                              kurbaniIndex=0;
                              cuttingIndex=0;
                            });
                          }),
                      Text('${getTranslated(context, "BREEDER")}',style: TextStyle(color:(breederIndex==1)?Color(0xff002E77):Colors.grey ),)
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value:'${getTranslated(context, "KURBANI")}', groupValue: _btn,

                          activeColor: (kurbaniIndex==1)?Color(0xff002E77):Colors.grey,
                          fillColor: MaterialStateColor.resolveWith((states) => (kurbaniIndex==1)?Color(0xff002E77):Colors.grey ),
                          onChanged:(value){
                            setState(() {

                              _btn=value.toString();
                              breederIndex=0;
                              kurbaniIndex=1;
                              cuttingIndex=0;
                            });
                          }),
                      Text('${getTranslated(context, "KURBANI")}',style: TextStyle(color:(kurbaniIndex==1)?Color(0xff002E77):Colors.grey ),)
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value:'${getTranslated(context, "CUTTING")}', groupValue: _btn,

                          activeColor: Color(0xff002E77),
                          fillColor: MaterialStateColor.resolveWith((states) => (cuttingIndex==1)?Color(0xff002E77):Colors.grey ),
                          onChanged:(value){
                            setState(() {
                              _btn=value.toString();
                              kurbaniIndex=0;
                              breederIndex=0;
                              cuttingIndex=1;
                            });
                          }),
                      Text('${getTranslated(context, "CUTTING")}',style: TextStyle(color:(cuttingIndex==1)?Color(0xff002E77):Colors.grey ) ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,color: Colors.grey,),
              SizedBox(height: 15
                ,),
              Text('${getTranslated(context, "READY_FOR_SALE")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(value:'${getTranslated(context, "YES")}', groupValue: _btn2,

                          activeColor: (yesIndex==1)?Color(0xff002E77):Colors.grey ,
                          fillColor: MaterialStateColor.resolveWith((states) =>(yesIndex==1)?Color(0xff002E77):Colors.grey ),
                          onChanged:(value){
                            setState(() {
                              _btn2=value.toString();
                              yesIndex=1;
                              noIndex=0;
                            });
                          }),
                      Text('${getTranslated(context, "YES")}',style: TextStyle(color:(kurbaniIndex==1)?Color(0xff002E77):Colors.grey  ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(value:'${getTranslated(context, "NO")}', groupValue: _btn2,

                          activeColor:(noIndex==1)?Color(0xff002E77):Colors.grey ,
                          fillColor: MaterialStateColor.resolveWith((states) => (noIndex==1)?Color(0xff002E77):Colors.grey ),
                          onChanged:(value){
                            setState(() {
                              _btn2=value.toString();
                              noIndex=1;
                              yesIndex=0;
                            });
                          }),
                      Text('${getTranslated(context, "NO")}',style: TextStyle(color:(noIndex==1)?Color(0xff002E77):Colors.grey ),)
                    ],
                  ),

                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,color: Colors.grey,),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${getTranslated(context, "SALE_WEIGHT")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    color: Colors.white,
                    child: CustomTextFormField(hintText: '',),
                  )

                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${getTranslated(context, "SALE_PRICE")}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    color: Colors.white,
                    child: CustomTextFormField(hintText: '',),
                  )

                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,color: Colors.grey,),
              SizedBox(height: 40,),
              Btn(title: '${getTranslated(context, "SAVE")}',height: 50,width: MediaQuery.of(context).size.width,
              onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimalRecord()));
              },)
            ],
          ) ,
        ),
      ),
    );
  }

  String? catId;
  AnimalCatList? animalCat;
  AnimalCatResponse? animalCatResponse;
  Future<void> animalCatApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.animalCategory)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        animalCatResponse = AnimalCatResponse.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

  }


  String? breedId;
  BreedDataList? animalBreed;
  BreedListModel? breedListModel;
  Future<void> breedListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.breedList)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        breedListModel = BreedListModel.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

  }
}

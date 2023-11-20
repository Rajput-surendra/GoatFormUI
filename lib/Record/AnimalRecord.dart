import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import '../ApiPath/Api.dart';
import '../Helper/session.dart';
import '../Model/animal_list_model.dart';
import '../Scanner/scanner_view.dart';
import '../Screens/AddNewAnimal.dart';

class AnimalRecord extends StatefulWidget {
   AnimalRecord({Key? key,this.taqId}) : super(key: key);
   String? taqId;
  @override
  State<AnimalRecord> createState() => _AnimalRecordState();
}

class _AnimalRecordState extends State<AnimalRecord> {
  @override
  void initState() {
    // TODO: implement initState
    currentindex1 = true;
    pageChange = 1;
    super.initState();
    animalListApi("","all");
    tgC.text =  widget.taqId.toString();

  }
  AnimalListModel? animalListModel;
  animalListApi(String? tagId,filter) async {
    var parameter = {
       "tag_id":tagId,
      "filter":tagId == ""?filter :""
    };
    print('_____parameter_____${parameter}_________');
    apiBaseHelper.postAPICall(Uri.parse(ApiService.animalList), parameter).then((getData) {
      bool error = getData['error'];
      String msg = getData['message'];
      if (error ==  false) {
        setState(() {
          animalListModel = AnimalListModel.fromJson(getData);
          Fluttertoast.showToast(msg: "${msg}");
        });
      }else {
        animalListModel = AnimalListModel();
        Fluttertoast.showToast(msg: "${msg}");
        setState(() {});
      }
    });
  }



  String? breedValue;
  final List<String> breedValueitems = ['Goat', 'Standard', 'Premium'];
  bool currentindex1 = false;
  bool currentindex2 = false;
  bool currentindex3 = false;
  bool currentindex4 = false;
  bool currentindex5 = false;
  bool currentindex6 = false;
  bool currentindex7 = false;

  var pageChange;
  TextEditingController  tgC =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAnimal()));
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // appBar: customAppBar(
      //   context: context,
      //   text: "${getTranslated(context, "ANIMAL_RECORD")}",
      //   isTrue: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text("${getTranslated(context, "TAG_ID")}"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: size.width / 1,
                child: Card(
                  child: Container(
                    height: 55,
                    child: Center(
                      child: TextFormField(
                        controller: tgC,
                        decoration: InputDecoration(
                            suffixIcon: Container(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanPay())).then((value){
                                      if(value != null){
                                        print('______value____${value}_________');
                                        animalListApi(value ,"");

                                      }
                                    });;
                                  },
                                  child: Image.asset("assets/images/Group 72309.png")),
                            ),
                            contentPadding: EdgeInsets.only(left: 10,top: 20),
                            border: InputBorder.none),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please Enter 2nd onwards';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  // height: size.height / 1.7,
                  width: size.width / 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                animalListApi("","all");
                                currentindex1 = true;
                                pageChange = 1;
                                if (currentindex1 == true) {
                                  currentindex2 = false;
                                  currentindex3 = false;
                                  currentindex4 = false;
                                  currentindex5 = false;
                                  currentindex6 = false;
                                  currentindex7 = false;
                                }
                              });
                            },
                            child: CustomCard3(
                              title: '${getTranslated(context, "ALL_ANIMALS")}',
                              currentindex: currentindex1,
                            ),
                          ),
                          InkWell(
                            onTap: () {

                              setState(() {
                                animalListApi("","male");
                                currentindex2 = true;
                                pageChange = 2;
                                if (currentindex2 == true) {
                                  currentindex1 = false;
                                  currentindex3 = false;
                                  currentindex4 = false;
                                  currentindex5 = false;
                                  currentindex6 = false;
                                  currentindex7 = false;
                                }
                              });
                            },
                            child: CustomCard3(
                              title: '${getTranslated(context, "MALE")}',
                              currentindex: currentindex2,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                animalListApi("","female");
                                currentindex3 = true;
                                pageChange = 3;
                                if (currentindex3 == true) {
                                  currentindex2 = false;
                                  currentindex1 = false;
                                  currentindex4 = false;
                                  currentindex5 = false;
                                  currentindex6 = false;
                                  currentindex7 = false;
                                }
                              });
                            },
                            child: CustomCard3(
                              title: '${getTranslated(context, "FEMALE")}',
                              currentindex: currentindex3,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                animalListApi("","kids");
                                currentindex4 = true;
                                pageChange = 4;
                                if (currentindex4 == true) {
                                  currentindex2 = false;
                                  currentindex3 = false;
                                  currentindex1 = false;
                                  currentindex5 = false;
                                  currentindex6 = false;
                                  currentindex7 = false;
                                }
                              });
                            },
                            child: CustomCard3(
                              title: '${getTranslated(context, "KIDS")}',
                              currentindex: currentindex4,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                animalListApi("","pregnant");
                                currentindex5 = true;
                                pageChange = 5;
                                if (currentindex5 == true) {
                                  currentindex2 = false;
                                  currentindex3 = false;
                                  currentindex4 = false;
                                  currentindex1 = false;
                                  currentindex6 = false;
                                  currentindex7 = false;
                                }
                              });
                            },
                            child: CustomCard3(
                              title: '${getTranslated(context, "PREGNANT")}',
                              currentindex: currentindex5,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                animalListApi("","matted");
                                currentindex6 = true;
                                pageChange = 6;
                                if (currentindex6 == true) {
                                  currentindex2 = false;
                                  currentindex3 = false;
                                  currentindex4 = false;
                                  currentindex5 = false;
                                  currentindex1 = false;
                                  currentindex7 = false;
                                }
                              });
                            },
                            child: CustomCard3(
                              title: '${getTranslated(context, "MATTED")}',
                              currentindex: currentindex6,
                            ),
                          ),

                          // InkWell(
                          //   onTap: () {
                          //     setState(() {
                          //       currentindex6 = true;
                          //       pageChange = 6;
                          //       if (currentindex6 == true) {
                          //         currentindex2 = false;
                          //         currentindex3 = false;
                          //         currentindex4 = false;
                          //         currentindex5 = false;
                          //         currentindex1 = false;
                          //         currentindex7 = false;
                          //       }
                          //     });
                          //   },
                          //   child: CustomCard3(
                          //     title: '${getTranslated(context, "MATTED")}',
                          //     currentindex: currentindex6,
                          //   ),
                          // ),

                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),


                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${getTranslated(context, "TOTAL_ANIMAL")}: 05",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colors.darkBlue),
                  ),
                  Text(
                    "${getTranslated(context, "TOTAL_WEIGHT")}: 137 kg",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colors.darkBlue),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 500,
                child: ListView.builder(
                    itemCount: animalListModel?.data?.length,
                    itemBuilder: (c,i){
                      return  Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Tag ID:"),
                                      Text("${animalListModel?.data?[i].tagId}")
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Age:"),
                                      Text("${animalListModel?.data?[i].age}")
                                    ],
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text("Weight"),
                                      ),
                                      Text("${animalListModel?.data?[i].weight}")
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text("Weight"),
                                      ),
                                      Text("${animalListModel?.data?[i].weight}")
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("${animalListModel?.data?[i].procurement}")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("${animalListModel?.data?[i].ifMale}"),
                                    ],
                                  ),


                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              pageChange == 1
                  ? Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomCard4(
                          name1: "${getTranslated(context, "TAG_ID")}: F001",
                          name2: "${getTranslated(context, "AGE")}:12",
                          name3: "${getTranslated(context, "FEMALE")}",
                          name4: "Osmanabad",
                          name5: "${getTranslated(context, "WEIGHT")}:48",
                          name6: "${getTranslated(context, "STATUS")}:Empty"),

                    ],
                  ),
                ),
              )
                  : Container(),
              pageChange == 2 ? Text("Page 2") : Container(),
              pageChange == 3 ? Text("Page 3") : Container(),
              pageChange == 4 ? Text("Page 4") : Container(),
              pageChange == 5 ? Text("Page 5") : Container(),
              pageChange == 6 ? Text("Page 6") : Container(),
              pageChange == 7 ? Text("Page 7") : Container(),
            ],
          ),
        ),
      ),
    );
  }

  int _currentIndex = 1 ;
  allAnimalCard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  _currentIndex = 1;
                  // getNewListApi(1);

                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _currentIndex == 1 ?
                    colors.primary
                        : colors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 45,
                child: Center(
                  child: Text("Event",style: TextStyle(color: _currentIndex == 1 ?colors.whiteTemp:colors.blackTemp,fontSize: 18)),
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  _currentIndex = 2;
                  // getNewListApi(3);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _currentIndex == 2 ?
                    colors.primary
                        : colors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                // width: 120,
                height: 45,
                child: Center(
                  child: Text("Online Webinars",style: TextStyle(color: _currentIndex == 2 ?colors.whiteTemp:colors.blackTemp,fontSize: 18),),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
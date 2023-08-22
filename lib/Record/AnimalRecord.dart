import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import '../Helper/session.dart';
import '../Screens/AddNewAnimal.dart';

class AnimalRecord extends StatefulWidget {
  const AnimalRecord({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAnimal()));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      appBar: customAppBar(
        context: context,
        text: "${getTranslated(context, "ANIMAL_RECORD")}",
        isTrue: true,
      ),
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
                        // controller: supplementController,
                        decoration: InputDecoration(
                            suffixIcon: Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset("assets/images/Group 72309.png"),
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter 2nd onwards';
                          }
                          return null;
                        },
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
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
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
                          InkWell(
                            onTap: () {
                              setState(() {
                                currentindex7 = !currentindex7;
                                pageChange = 7;
                                if (currentindex7 == true) {
                                  currentindex2 = false;
                                  currentindex3 = false;
                                  currentindex4 = false;
                                  currentindex5 = false;
                                  currentindex6 = false;
                                  currentindex1 = false;
                                }
                              });
                            },
                            child: CustomCard3(
                              title: '${getTranslated(context, "EMPTY")}',
                              currentindex: currentindex7,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                      const SizedBox(
                        height: 20,
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
                              CustomCard4(
                                  name1: "${getTranslated(context, "TAG_ID")}: F002",
                                  name2: "${getTranslated(context, "AGE")}:9",
                                  name3: "${getTranslated(context, "FEMALE")}",
                                  name4: "Osmanabad",
                                  name5: "${getTranslated(context, "WEIGHT")}:35",
                                  name6: "${getTranslated(context, "STATUS")}:Pregnant"),
                              CustomCard4(
                                  name1: "${getTranslated(context, "TAG_ID")}: F003",
                                  name2: "${getTranslated(context, "AGE")}:7",
                                  name3: "${getTranslated(context, "MALE")}",
                                  name4: "Osmanabad",
                                  name5: "${getTranslated(context, "WEIGHT")}:27",
                                  name6: "${getTranslated(context, "STATUS")}:Breeder"),
                              CustomCard4(
                                  name1: "${getTranslated(context, "TAG_ID")}: F004",
                                  name2: "${getTranslated(context, "AGE")}:6",
                                  name3: "${getTranslated(context, "PREGNANT")}",
                                  name4: "Osmanabad",
                                  name5: "${getTranslated(context, "WEIGHT")}:15",
                                  name6: "${getTranslated(context, "STATUS")}:Empty"),
                              CustomCard4(
                                  name1: "${getTranslated(context, "TAG_ID")}: F005",
                                  name2: "${getTranslated(context, "AGE")}:4",
                                  name3: "${getTranslated(context, "MALE")}",
                                  name4: "Osmanabad",
                                  name5: "${getTranslated(context, "WEIGHT")}:12",
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
            ],
          ),
        ),
      ),
    );
  }
}
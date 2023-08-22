import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


import '../../Helper/AppBtn.dart';
import '../../Helper/CustomText.dart';
import '../../Utils/Colors.dart';
import '../../helper/appbar.dart';
import 'AddMilkRecord.dart';
class MilkRecord extends StatefulWidget {
  const MilkRecord({Key? key}) : super(key: key);

  @override
  State<MilkRecord> createState() => _MilkRecordState();
}

class _MilkRecordState extends State<MilkRecord> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: customAppBar(
        context: context,
        text: "Milk Record",
        isTrue: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(

                height: 10,
              ),
              Text('Category wise'),
              SizedBox(

                height: 5,
              ),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tag ID : F001",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(

                                      height: 5,
                                    ),
                                    Text(
                                      "Osmanabad",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Age : 15 (month)",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(

                                      height: 5,
                                    ),
                                    Text(
                                      "Weight : 35 (Kg)",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Milk Date : 12/08/23",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(

                              height: 5,
                            ),
                            Text(
                              "Milk : 1.5 ltr",
                              style:
                              TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(

                height: 10,
              ),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tag ID : F002",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(

                                      height: 5,
                                    ),
                                    Text(
                                      "Osmanabad",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Age : 15 (month)",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Weight : 35 (Kg)",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Milk Date : 12/08/23",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(

                              height: 5,
                            ),
                            Text(
                              "Milk : 1.5 ltr",
                              style:
                              TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.secondary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMilkRecord()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
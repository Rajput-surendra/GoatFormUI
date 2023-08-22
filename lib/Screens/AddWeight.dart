import 'package:flutter/material.dart';

import '../Helper/Appbar.dart';
import '../Helper/session.dart';
import '../Utils/Colors.dart';

class AddWeight extends StatefulWidget {
  final String tagid;
  final String breed;
  final String age;
  final String weight;

  const AddWeight(
      {Key? key,
        required this.tagid,
        required this.breed,
        required this.age,
        required this.weight})
      : super(key: key);

  @override
  State<AddWeight> createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: "${getTranslated(context, "ADD_WEIGHT")}",
        isTrue: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                   Text(
                    "${getTranslated(context, "TAG_ID")} ",
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
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
                            suffixIcon:Container(
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

              SizedBox(
                height: size.height / 40,
              ),
              // leading: Icon(icon),
              Container(
                width: size.width,
                child: Row(
                  children: [
                    Text(
                      "${getTranslated(context, "TAG_ID")} : ${widget.tagid}",
                      style: TextStyle(
                          fontSize: 12,
                          color: colors.textColor,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: size.width / 25,
                    ),
                    Text(
                      "${getTranslated(context, "BREED")} : ${widget.breed}",
                      style: TextStyle(
                          fontSize: 12,
                          color: colors.textColor,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: size.width / 25,
                    ),
                    Text(
                      "${getTranslated(context, "AGE")} : ${widget.age}",
                      style: TextStyle(
                          fontSize: 12,
                          color: colors.textColor,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: size.width / 25,
                    ),
                    Container(
                      width: 78,
                      child: Text(
                        "${getTranslated(context, "LAST_WEIGHT")} : ${widget.weight}",
                        style: TextStyle(
                            fontSize: 12,
                            color: colors.textColor,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${getTranslated(context, "WEIGHT")}",
                        style: TextStyle(color: colors.blacktextColor),
                      ),
                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child:  SizedBox(
                          width: size.width/2.3,
                          child: TextFormField(decoration: InputDecoration(
                            // hintText: 'Enter your text',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${getTranslated(context, "LAST_WEIGHT")}",
                        style: TextStyle(color: colors.blacktextColor),
                      ),

                      Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: SizedBox(width: size.width/2.3,
                          child: TextFormField(decoration: InputDecoration(
                            // hintText: 'Enter your text',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${getTranslated(context, "REMARK")}",
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                ],
              ),
              Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextFormField(decoration: InputDecoration(
                  // hintText: 'Enter your text',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                ),
              ),
              SizedBox(
                height: size.height/3,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: size.width / 1.1,
                  height: size.height / 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: colors.darkBlue,
                  ),
                  child: Center(
                      child: Text(
                        "${getTranslated(context, "LAST_WEIGHT")}",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: colors.transparent),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
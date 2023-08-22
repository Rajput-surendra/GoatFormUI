import 'package:flutter/material.dart';


import '../../Helper/Appbar.dart';
import '../../Utils/Colors.dart';

class AddDeathRecord extends StatefulWidget {
  final String breed;
  final String age;
  final String weight;

  const AddDeathRecord({Key? key,
    required this.breed,
    required this.age,
    required this.weight})
      : super(key: key);

  @override
  State<AddDeathRecord> createState() => _AddDeathRecordState();
}

class _AddDeathRecordState extends State<AddDeathRecord> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: "Add Death Record",
        isTrue: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Tag ID*",
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
                            suffixIcon:
                            Container(
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Breed : ${widget.breed}",
                    style: TextStyle(
                        fontSize: 15,
                        color: colors.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: size.width / 25,
                  ),
                  Text(
                    "Age : ${widget.age}",
                    style: TextStyle(
                        fontSize: 15,
                        color: colors.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: size.width / 25,
                  ),
                  Text(
                    "Last Weight : ${widget.weight}",
                    style: TextStyle(
                        fontSize: 15,
                        color: colors.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Weight",
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                  Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child:  SizedBox(
                      // width: size.width/2.3,
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
              SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Remark",
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
                height: size.height/2.7,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MadhuFarma17()));
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
                        "Save",
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
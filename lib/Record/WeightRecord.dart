import 'package:flutter/material.dart';

import '../../Helper/Appbar.dart';
import '../../Helper/CustomCard.dart';
import '../../Utils/Colors.dart';
import '../Helper/session.dart';
import '../Screens/AddWeight.dart';


class WeightRecord extends StatefulWidget {
  const WeightRecord({Key? key}) : super(key: key);

  @override
  State<WeightRecord> createState() => _WeightRecordState();
}

class _WeightRecordState extends State<WeightRecord> {
  String name1="goat";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppBar(
        context: context,
        text: '${getTranslated(context, "WEIGHT_RECORD")}',
        isTrue: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWeight(tagid: 'jjj',
              breed: 'kkk', age: 'ffgggggf', weight: 'sss')));

          // Action to perform when the button is pressed.
          // For example, navigate to a new screen or show a dialog.
        },
        child: Icon(Icons.add),
        backgroundColor: colors.darkBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

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
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${getTranslated(context, "TAG_ID")}',
                    style: TextStyle(color: colors.blacktextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
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

              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWeight(tagid: ,
                  //   breed: '', age: '', weight: '',)));
                },
                child: CustomCard5(
                  name1: '${getTranslated(context, "TAG_ID")} : F001',
                  name2: '${getTranslated(context, "LAST_WEIGHT")} : 25 kg',
                  name3: 'Osmanabad',
                  name4: '${getTranslated(context, "WEIGHT_ON")} : 25/06/2023',
                ),
              ),
              CustomCard5(
                name1: '${getTranslated(context, "TAG_ID")} : F002',
                name2: '${getTranslated(context, "LAST_WEIGHT")} : 25 kg',
                name3: 'Osmanabad',
                name4: '${getTranslated(context, "WEIGHT_ON")} : 25/06/2023',
              ),
              CustomCard5(
                name1: '${getTranslated(context, "TAG_ID")} : F003',
                name2: '${getTranslated(context, "LAST_WEIGHT")} : 25 kg',
                name3: 'Sirohi',
                name4: '${getTranslated(context, "WEIGHT_ON")} : 25/06/2023',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
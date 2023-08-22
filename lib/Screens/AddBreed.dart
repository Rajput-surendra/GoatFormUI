import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/Colors.dart';

import '../Helper/Appbar.dart';
import '../Helper/session.dart';
// import '../Utils/Colors.dart';

class AddBreed extends StatefulWidget {
  const AddBreed({Key? key}) : super(key: key);

  @override
  State<AddBreed> createState() => _AddBreedState();
}

class _AddBreedState extends State<AddBreed> {
  String dropdownValue = 'Goat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      appBar:customAppBar(context: context, text:'${getTranslated(context, "ADD_BREED")}', isTrue: true, ),
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
              Text('${getTranslated(context, "CATEGORIES")}'),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Goat', 'Goat2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('${getTranslated(context, "GESTATION_PERIOD")}'),
              SizedBox(
                height: 5,
              ),
              Card(
                elevation: 4,
                child:  Container(
                  child:TextFormField(
                    // controller: supplementController,
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
                    // controller: supplementController,
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
                    // controller: supplementController,
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
                ),)
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) =>  Add_Breading()),
          // );
        },
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 30, left: 15, right: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            color: Color(0xFF002E77),
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
                  '${getTranslated(context, "SAVE")}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
      ),
    );
  }
}
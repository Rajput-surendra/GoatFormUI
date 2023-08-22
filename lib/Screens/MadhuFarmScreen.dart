import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../Utils/Colors.dart';
import 'HomeScreen.dart';
import 'PunchIn.dart';

class MadhuFarmScreen extends StatefulWidget {
  const MadhuFarmScreen({Key? key}) : super(key: key);

  @override
  State<MadhuFarmScreen> createState() => _MadhuFarmScreenState();
}

class _MadhuFarmScreenState extends State<MadhuFarmScreen> {
  String? _selectedOption;
  String? _selectedForOption;

  final TextEditingController _chargeController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.grad1Color,
        appBar: AppBar(
          backgroundColor: colors.primary,
          elevation: 0,
          centerTitle: true,
          title: Text(getTranslated(context, "MADHU_FARM"),
            style: TextStyle(color: colors.secondary,fontSize: 20),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage()));
                },
                  child: Icon(Icons.menu,color: colors.secondary)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 3,
                child:  Container(
                  // width: MediaQuery.of(context).size.width/2.67,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: DropdownButton2<String>(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(Icons.keyboard_arrow_down_outlined,size: 30,color: colors.secondary,),
                    ),
                    isExpanded: true,
                    value:_selectedOption,
                    style: TextStyle(color: colors.secondary),

                    items: <String>['Goat', 'Standard', 'Premium'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                    hint: Text(
                      "Select Farm",style: TextStyle(color: colors.secondary),
                    ),
                    onChanged: (String? value)  {
                      setState(() {
                        _selectedOption = value;
                      });
                    },

                    underline: Container(  // Use a container with zero height to remove the underline
                      height: 0,
                      color: Colors.transparent,
                    ),
                  ),


                )

                // Container(
                //
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.symmetric(horizontal: 10),
                //   decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
                //   child: DropdownButton<String>(
                //     hint: Text("Select Farm"),
                //     isExpanded: true,
                //     alignment: Alignment.center,
                //     value: _selectedOption,
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.black),
                //     underline: Container(),
                //     // hint: Text(
                //     //   'Goat',
                //     //   textAlign: TextAlign.left,
                //     // ),
                //     onChanged: (String? value) {
                //       setState(() {
                //         _selectedOption = value;
                //       });
                //     },
                //     items: <String>['Goat', 'Standard', 'Premium']
                //         .map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 3,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,),
                  // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                  child: Column(
                    children: [
                      listTile(key: 'Total Animal', value: '26'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: colors.white70,
                      ),
                      listTile(key: 'Male', value: '2'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: colors.white70,
                      ),
                      listTile(key: 'Female', value: '5'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey,
                      ),
                      listTile(key: 'Pregnant', value: '5'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey,
                      ),
                      listTile(key: 'Breeder', value: '2'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey,
                      ),
                      listTile(key: 'Kids(0-3 Month)', value: '5'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    floatingActionButton: new FloatingActionButton(
        elevation: 0.0,
        child: new Icon(Icons.add),
        backgroundColor: colors.secondary,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PunchInScreen()));
        }
    ));
  }

  Widget listTile({required String key, required String value}) {
    return ListTile(
      title: Text(key),
      trailing: Text(value),
    );
  }
}
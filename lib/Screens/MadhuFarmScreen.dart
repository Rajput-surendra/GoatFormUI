import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../ApiPath/Api.dart';
import '../Model/animal_cat_model_response.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    animalCatApi();
  }
  AnimalCatResponse? animalCatResponse;
  Future<void> animalCatApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.animalCategory)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        animalCatResponse = AnimalCatResponse.fromJson(getData);
      }else {

      }

    });

  }
  Future<void> animalCountApi(String? catId) async {

    var parameter = {
      "animal_type":catId,

    };

    apiBaseHelper.postAPICall(Uri.parse(ApiService.register), parameter).then((getData) {
      bool error = getData['error'];
      if (error ==  false) {
        animalCatResponse = AnimalCatResponse.fromJson(getData);
      }

    });
  }
  String? animalCat ,catId;
  int? selectedSateIndex;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    child: Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colors.primary),
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return true;
      },
      child: Scaffold(
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

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        hint: const Text('Select Farm',
                          style: TextStyle(
                              color: colors.black54,fontWeight: FontWeight.w500,fontSize:15
                          ),),
                        // dropdownColor: colors.primary,
                        value: animalCat,
                        icon:  const Padding(
                          padding: EdgeInsets.only(left:10.0),
                          child: Icon(Icons.keyboard_arrow_down_rounded,  color:colors.secondary,size: 30,),
                        ),
                        // elevation: 16,
                        style:  const TextStyle(color: colors.secondary,fontWeight: FontWeight.bold),
                        underline: Padding(
                          padding: const EdgeInsets.only(left: 0,right: 0),
                          child: Container(
                            // height: 2,
                            color:  colors.whiteTemp,
                          ),
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            animalCat = value!;

                            animalCatResponse?.data?.forEach((element) {
                              if(element.name == value){
                                selectedSateIndex = animalCatResponse?.data?.indexOf(element);
                                catId = element.id;
                               // getCityApi(catId!);

                              }
                            });
                          });
                        },
                        items: animalCatResponse?.data?.map((items) {
                          return DropdownMenuItem(
                            value: items.name.toString(),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width/1.42,
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
      )),
    );
  }

  Widget listTile({required String key, required String value}) {
    return ListTile(
      title: Text(key),
      trailing: Text(value),
    );
  }
}
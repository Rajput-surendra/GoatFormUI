import 'package:flutter/material.dart';
import '../../Helper/Appbar.dart';
import '../Helper/Colors.dart';
import '../Helper/session.dart';
import '../Screens/NewPurchase.dart';

class PurchaseRecord extends StatefulWidget {
  const PurchaseRecord({Key? key}) : super(key: key);

  @override
  State<PurchaseRecord> createState() => _PurchaseRecordState();
}

class _PurchaseRecordState extends State<PurchaseRecord> {
  String dropdownValue = 'MF005';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: customAppBar(
        context: context,
        text:getTranslated(context, "PURCHASE_RECORD"),
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
              Text(getTranslated(context, "PURCHASE_CATEGORY")),
              SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
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
                    items: <String>['MF005', 'MF006']
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
              Card(
                child: Container(
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      tileColor: Colors.white,
                      title: Text(
                        '${getTranslated(context, "PARTY_NAME")} : Antara Medical',
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                        '${getTranslated(context, "MATERIAL")} : PPR Vaccine',
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${getTranslated(context, "DATE")} : 16/08/2023",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "${getTranslated(context, "QTY")} : 10 ${getTranslated(context, "ML")}",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          )
                        ],
                      ),
                    )),
              ),

              SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      tileColor: Colors.white,
                      title: Text(
                        '${getTranslated(context, "PARTY_NAME")} : Arun Pawar',
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                          '${getTranslated(context, "MATERIAL")} : Makka',
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${getTranslated(context, "DATE")} : 16/08/2023",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "${getTranslated(context, "QTY")} : 100 ${getTranslated(context, "ML")}",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:colors.secondary,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPurchase()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
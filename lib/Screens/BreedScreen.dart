import 'package:flutter/material.dart';


import '../ApiPath/Api.dart';
import '../Helper/Appbar.dart';
import '../Helper/AppBtn.dart';
import '../Helper/session.dart';
import '../Model/breed_list_model.dart';
import '../Utils/Colors.dart';
import 'AddBreed.dart';

class BreedScreen extends StatefulWidget {
  const BreedScreen({Key? key}) : super(key: key);
  @override
  State<BreedScreen> createState() => _BreedScreenState();
}
class _BreedScreenState extends State<BreedScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    breedListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
        appBar: customAppBar(context: context, text:'${getTranslated(context, "BREED_RECORD")}', isTrue: true, ),

      body:Container(
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
        onRefresh: () {
        return
        Future.delayed(Duration(seconds: 2),() {
          breedListApi();
        },);
      },
          child: ListView.builder(
            itemCount: 1,
              itemBuilder: (context,i){
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3/3.4,
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                  ),

                  itemCount:breedListModel?.data?.length ,// total number of items
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              breedListModel?.data?[index].image  ==  null || breedListModel?.data?[index].image == "" ? Container(
                                  height: 120,
                                  child: Image.asset("assets/image/img.png")): Container(
                                height: 120,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network("${breedListModel?.data?[index].image}",
                                    fit: BoxFit.fill,
                                  ),
                                ),

                              ),
                              SizedBox(height: 5,),
                              Text("${breedListModel?.data?[index].name}",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 3,),
                              Text('${breedListModel?.data?[index].parent}',style: TextStyle(
                                  color:colors.black12.withOpacity(0.5)
                              ),),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),

      // RefreshIndicator(
      //   onRefresh: () {
      //     return
      //     Future.delayed(Duration(seconds: 2),() {
      //       breedListApi();
      //     },);
      //   },
      //   child: ListView.builder(
      //     itemCount: 1,
      //       itemBuilder: (context,i){
      //     return Padding(
      //       padding: const EdgeInsets.only(top: 10),
      //       child: Container(
      //         height: MediaQuery.of(context).size.height,
      //         child: GridView.builder(
      //           // physics: ScrollPhysics(),
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             childAspectRatio: 3/4,
      //             crossAxisCount: 2, // number of items in each row
      //             mainAxisSpacing: 8.0, // spacing between rows
      //             crossAxisSpacing: 8.0, // spacing between columns
      //           ),
      //
      //           itemCount:breedListModel?.data?.length ,// total number of items
      //           itemBuilder: (context, index) {
      //             return Container(
      //               child: Card(
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10)
      //                 ),
      //                 child: Container(
      //                   margin: EdgeInsets.all(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       breedListModel?.data?[index].image  ==  null || breedListModel?.data?[index].image == "" ? Container(
      //                           height: 120,
      //                           child: Image.asset("assets/image/img.png")): Container(
      //                         height: 120,
      //                         width: double.infinity,
      //                         child: ClipRRect(
      //                           borderRadius: BorderRadius.circular(10),
      //                           child: Image.network("${breedListModel?.data?[index].image}",
      //                             fit: BoxFit.fill,
      //                           ),
      //                         ),
      //
      //                       ),
      //                       SizedBox(height: 3,),
      //                       Text("${breedListModel?.data?[index].name}",style: TextStyle(
      //                           fontWeight: FontWeight.bold
      //                       ),),
      //                       SizedBox(height: 3,),
      //                       Text('${breedListModel?.data?[index].parent}',style: TextStyle(
      //                           color:colors.black12.withOpacity(0.5)
      //                       ),),
      //
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     );
      //   }),
      // ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            backgroundColor: colors.secondary,
            onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBreed()));
            }
        )
     
    );
  }

  BreedListModel? breedListModel;
  Future<void> breedListApi() async {
    apiBaseHelper.getAPICall(Uri.parse(ApiService.breedList)).then((getData) {
      bool error = getData ['error'];
      if(!error){
        breedListModel = BreedListModel.fromJson(getData);
        setState(() {

        });
      }else {

      }

    });

  }
}

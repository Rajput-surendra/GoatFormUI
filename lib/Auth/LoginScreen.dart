import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madhu_farma/Helper/session.dart';


import 'SignUpScreen.dart';
import '../Helper/AppBtn.dart';
import '../Utils/colors.dart';
import '../Screens/MadhuFarmScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCheck = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      body: Container(
        height: MediaQuery.of(context).size.height*1.3,
        child:Stack(
          children:[ Column(
            children: [
                 Container(
                   height: MediaQuery.of(context).size.height/2.1,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(30),
                       bottomLeft: Radius.circular(30)
                     ),
                     color:colors.yellow
                     ),
                   ),
                 
            ],
          ),
          Positioned(
            top: 50,
            left: 0,
          right: 0,
            child: Column(

              children: [
                Container(
                  child: Column(
                    children: [
                      Text(getTranslated(context, "WELCOME_TO"),
                      style: TextStyle(
                        color: Color(0xff002E77),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 5,),
                      Text(getTranslated(context, "MADHU_FARM"),
                        style: TextStyle(
                            color: Color(0xff002E77),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 20,),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20,top: 10),
                ),

                Container(
                  height: MediaQuery.of(context).size.height/2,
                  margin: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                       child: Container(
                         padding: EdgeInsets.all(21),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             TextFormField(
                               keyboardType: TextInputType.number,
                               inputFormatters: [
                                 LengthLimitingTextInputFormatter(10),
                               ],
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Mobile nO is required';
                                 }else if(value.length<9){
                                   return 'Mobile should have aleast 10 characters';
                                 }
                                 return null;
                               },

                               decoration: InputDecoration(
                                 border: InputBorder.none,
                                 prefixIcon: Icon(Icons.call),
                                 // fillColor: Color(0x25888888),
                                 filled: true,
                                 hintText: getTranslated(context, "MOBILE_NO"),
                               ),
                             ),
                             SizedBox(height: 20,),
                             TextFormField(
                               obscureText: true,
                               keyboardType: TextInputType.visiblePassword,
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return 'Password is required';
                                 }else if(value.length<8){
                                   return 'Password should have aleast 8 characters';
                                 }
                                 return null;
                               },

                               decoration: InputDecoration(
                                 border: InputBorder.none,
                                 prefixIcon: Icon(Icons.lock),
                                 // fillColor: Color(0x25888888),
                                 filled: true,
                                 hintText: getTranslated(context, "PASSWORD"),

                               ),
                             ),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [

                                 Row(
                                   children: [
                                     Checkbox(
                                       value: isCheck,
                                       checkColor: colors.blackTemp, // color of tick Mark
                                       fillColor: MaterialStateProperty.all(colors.black54),
                                       onChanged: (value) {
                                         setState(() {
                                           isCheck = value!;
                                         });
                                       },
                                     ),
                                   Text(getTranslated(context, "REMEMBER_PASSWORD"),style: TextStyle(
                                     fontSize: 10,color: colors.black54
                                   ),),
                                   SizedBox(width: 10,)],
                                 ),
                                 Text(getTranslated(context, "FORGOT_PASSWORD"),style: TextStyle(
                                     fontSize: 10,color: colors.black54
                                 ),)
                               ],
                             ),
                             SizedBox(height: 20,),
                             Btn(
                               onPress: (){
                                 if(_formKey.currentState!.validate()){
                                   if(isCheck == true){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MadhuFarmScreen())) ;
                                   }else{
                                     Fluttertoast.showToast(msg: "Select remember",backgroundColor: colors.secondary);
                                   }
                                 }
                                 else{
                                   Fluttertoast.showToast(msg: "Please Field App Field !!!",backgroundColor: colors.secondary);

                                 }
                               },
                               title:getTranslated(context, "LOG_IN"),
                               height: MediaQuery.of(context).size.width/8,
                             ),
                             SizedBox(height: 15,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(getTranslated(context, "DONT'T_HAVE_AN_ACCOUNT"),
                                 style: TextStyle(
                                   fontSize: 12,color: colors.black54
                                 ),),
                                 GestureDetector(
                                   onTap: (){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                   },
                                   child: Text(getTranslated(context, "SIGN_UP"),textAlign: TextAlign.center,
                                     style: TextStyle(
                                         fontSize: 12,
                                       color: colors.secondary,fontWeight: FontWeight.bold,
                                     ),),
                                 ),

                               ],
                             )
                           ],
                         ),
                       ),
                    ),
                  ),
                ),
              ],
            ),
          )]
        ) ,
      ),
    );
  }
}

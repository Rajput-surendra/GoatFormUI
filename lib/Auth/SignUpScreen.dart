import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madhu_farma/Helper/session.dart';


import '../Helper/AppBtn.dart';
import '../Utils/colors.dart';
import 'LoginScreen.dart';
import '../Screens/MadhuFarmScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? userType ;
  bool visible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.grad1Color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.0,
              child:Stack(
                  children:[ Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/2.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            ),
                            color:colors.primary
                        ),
                      ),

                    ],
                  ),

                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: SingleChildScrollView(
                        child: Column(

                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(getTranslated(context, "CREATE_NEW_ACCOUNT"),
                                    style: TextStyle(
                                        color: colors.secondary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),),

                                  SizedBox(height: 40,),
                                ],
                              ),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 20,top: 10),
                            ),

                            Container(
                              // height: MediaQuery.of(context).size.height/1.5,
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
                                        Container(
                                          
                                          // width: MediaQuery.of(context).size.width/2.67,
                                          height: 50,
                                          padding: EdgeInsets.only(left: 10),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                              color: Color(0x25888888)
                                          ),
                                          child: DropdownButton2<String>(
                                            icon: Padding(
                                              padding: const EdgeInsets.only(right: 5),
                                              child: Icon(Icons.keyboard_arrow_down_outlined,size: 30,),
                                            ),
                                            isExpanded: true,
                                            value:userType,
                                            style: TextStyle(color: Colors.black87),

                                            items: <String>[
                                              'General User',
                                              'Special User',
                                            ].map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),

                                            hint: Text(
                                             getTranslated(context, "USER_TYPE"),
                                            ),
                                            onChanged: (String? value)  {
                                              setState(() {
                                                userType = value;
                                              });
                                            },

                                            underline: Container(  // Use a container with zero height to remove the underline
                                              height: 0,
                                              color: Colors.transparent,
                                            ),
                                          ),


                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(10),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Farm is required';
                                              }
                                              return null;
                                            },

                                            decoration: InputDecoration(

                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.person_rounded),
                                              fillColor: Color(0x25888888),
                                              filled: true,
                                              hintText: getTranslated(context, "FARM_NAME"),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10),
                                          ],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'First Name is required';
                                            }
                                            return null;
                                          },

                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.person_rounded),
                                            fillColor: Color(0x25888888),
                                            filled: true,
                                            hintText: getTranslated(context, "FIRST_NAME"),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10),
                                          ],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Last Name is required';
                                            }
                                            return null;
                                          },

                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.person_rounded),
                                            fillColor: Color(0x25888888),
                                            filled: true,
                                            hintText: getTranslated(context, "LAST_NAME"),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10),
                                          ],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'mobile no. is required';
                                            }
                                            return null;
                                          },

                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.call),
                                            fillColor: Color(0x25888888),
                                            filled: true,
                                            hintText: getTranslated(context, "MOBILE_NO"),
                                          ),
                                        ),
                                        SizedBox(height: 10,),


                                        TextFormField(
                                          keyboardType: TextInputType.visiblePassword,
                                          obscureText: (visible)?true:false,
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
                                            fillColor: Color(0x25888888),
                                            filled: true,
                                            hintText: getTranslated(context, "PASSWORD"),
                                            suffixIcon:IconButton(
                                              icon: Icon(visible
                                                  ? Icons.visibility_off
                                                  : Icons.visibility ),
                                              onPressed: () {
                                                setState(
                                                      () {
                                                    visible = !visible;
                                                  },
                                                );
                                              },
                                            ),

                                          ),
                                        ),

                                        SizedBox(height: 25,),
                                        Btn(
                                          onPress: (){
                                            if(_formKey.currentState!.validate()){
                                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MadhuFarmScreen())) ;
                                            }
                                          },
                                          title:getTranslated(context, "SIGN_UP"),
                                          height: MediaQuery.of(context).size.width/8,
                                        ),
                                        SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(getTranslated(context, "ALREADY_HAVE_AN_ACCOUNT_?"),
                                              style: TextStyle(
                                                  fontSize: 12,color: colors.black54
                                              ),),
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
                                              },
                                              child: Text(getTranslated(context, "LOG_IN"),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                  color: colors.secondary,fontWeight: FontWeight.bold
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

                            SizedBox(height: 30,)
                          ],
                        ),
                      ),
                    )
                  ]
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}


// import 'dart:async';
// import 'package:flutter/material.dart';
//
//
//
// import '../Auth/LoginScreen.dart';
// import '../Screens/goat_Farma_Screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds:5),() async{
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
//       // SharedPreferences prefs  = await SharedPreferences.getInstance();
//       // bool? isLogin  =  prefs.getBool('isLogin');
//       // if(isLogin ?? false) {
//       //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
//       // }else{
//       //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
//       // }
//
//       // checkFirstSeen();
//
//       // if(uid == null || uid == ""){
//       //   // return SeekerDrawerScreen();
//       //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       // }
//       // else{
//       //   if(type == "seeker") {
//       //     Navigator.push(context,
//       //         MaterialPageRoute(builder: (context) => RecruiterDashboard()));
//       //   }
//       //   else{
//       //     /// jsut for ddummy data RecruiterDashboard data is use
//       //   }
//       //     Navigator.push(context,
//       //         MaterialPageRoute(builder: (context) => RecruiterDashboard()));
//       //   }
//       //return SignInScreen();
//     });
//     // Timer(Duration(seconds: 3), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> IntroSlider()));});
//     super.initState();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     // Timer(
//     //     Duration(seconds: 3),
//     //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//     //        builder: (BuildContext context) => GoatFarmaScreen())));
//     return Scaffold(
//       body:
//       Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         //  width: 300,
//         child: Image(
//           image: AssetImage("assets/splash/splashScreen.png",),
//           fit: BoxFit.fill,
//         ),
//       ),
//
//     );
//   }
// }

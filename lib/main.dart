import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/firstpage.dart';
import 'package:teste/mainpage.dart';
import 'package:teste/secondpage.dart';
import 'package:teste/sign%20up.dart';

import 'menu.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget{
  var username;
  var password;
  var phone;
  var email;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(future: getdataw() , builder: (context ,snapshot ){
      if(snapshot.hasError){
        return MaterialApp(title: "error",debugShowCheckedModeBanner: false,
          home: Scaffold(body: Center(child: Text("Pls check internet connection"),),),);
      }
      if(snapshot.connectionState ==ConnectionState.done){
        return MaterialApp(theme: ThemeData(fontFamily: 'Cairo'),title: "first",debugShowCheckedModeBanner: false,
            home:username ==null ? Secondpage():Mainpage(username: username,password: password,
          email: email,phone: phone) //Section1(username: data,)
        );
      }
      return MaterialApp(title:"Loading",
        home: Scaffold(body: CircularProgressIndicator(),),);
    },);
  }
  Future getdataw() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.get("username");
    email = sharedPreferences.getString("email");
    password = sharedPreferences.getString("password");
    phone = sharedPreferences.getString("phone");
  }
}
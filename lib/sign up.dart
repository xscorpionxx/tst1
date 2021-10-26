import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;
import 'package:teste/secondpage.dart';

import 'mainpage.dart';
class Signup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Secondstates();
  }
}
class Secondstates extends State<Signup>{
  var stringa = "";
  List usernames =[];
  List emails =[];
  List phones =[];
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController repassword = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  static String validateemail(String value) {
    RegExp exp = new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(exp.hasMatch(value)){
      return null;
    }
    else{
      return "email cant be like that";
    }
  }
   String validatepassword(String value){
    stringa = value;
    if(value.length <6){
      return 'Password can\'t be less than 6 chracters' ;
    }
    if(value.isEmpty){
      return 'Password can\'t be empty' ;
    }
    return null;
  }
   String validatepasswordre(String value){

    if(value != stringa){
      return 'لا يوجد تطابق بين كلمتي السر' ;
    }
    return null;
  }
  static String validatename(String value) {
    if(value.isEmpty){
      return 'Place name can\'t be empty';
    }
    return null;
  }
  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'لا يمكنك ترك الرقم فارغ!';
    }
    else if (!regExp.hasMatch(value)) {
      return 'هذا الرقم غير صالح!';
    }
    return null;
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void signup() async{
    if(formKey.currentState.validate()){
      //get_all_users_that_have_sined_up_in_app
      var url = "";
      var response = await http.get(Uri.parse(url));
      var body = jsonDecode(response.body);
      List data =body;
      //here put the name of coloumn in the database
      for(int y =0 ; y<data.length ; y++){
        usernames.add(data[y][""]);
        emails.add(data[y][""]);
        phones.add(data[y][""]);
      }
      var able = true;
      if (data.length != null) {
        for (int s = 0; s < data.length; s++){
          if (usernames[s] == name.text) {
            able = false;
            //Navigator.of(context,rootNavigator: true).pop('dialog');
            return showDialog(context: context, builder: (context) {
              return AlertDialog(title: new Text("خطأ"),
                  content: new Text(
                      "هذا الاسم قيد الاستخدام في هذا التطبيق الرجاء استخدام اسم أخر"),
                  actions: [
                    new ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("ok"))
                  ]);
            });
          }
          if (emails[s] == email.text) {
            able = false;
            //Navigator.of(context,rootNavigator: true).pop('dialog');
            return showDialog(context: context, builder: (context) {
              return AlertDialog(title: new Text("خطأ"),
                  content: new Text(
                      "هذا الايميل قيد الاستعمال في هذا التطبيق الرجاء استخدام ايميل اخر"),
                  actions: [
                    new ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("ok"))
                  ]);
            });
          }
          if (phones[s] == phone.text) {
            able = false;
           // Navigator.of(context,rootNavigator: true).pop('dialog');
            return showDialog(context: context, builder: (context) {
              return AlertDialog(title: new Text("خطأ"),
                  content: new Text(
                      "هذا الرقم قيد الاستعمال في هذا التطبيق الرجاء استخدام رقم هاتف أخر"),
                  actions: [
                    new ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("ok"))
                  ]);
            });
          }
        }
        if (able) {
          var data = {"username": name.text, "password": password.text,"phone": phone.text,
          "email" : email.text};
          print(data);
          //put here the url to add account
          var url = "";
          var response = await http.post(Uri.parse(url), body: data);
       //   Navigator.of(context,rootNavigator: true).pop('dialog');
          Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return Mainpage(username: name.text,email : email.text , phone : phone.text,
                  password : password.text);
                }));
        }
      }
      else{
      }


    }
  }
  void viewmorefeat(){
  }
  var Value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Form(key: formKey,
      child: ListView(children: [
        Stack(
          children:[ Center(child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),width: MediaQuery.of(context).size.width * 0.5,height: MediaQuery.of(context).size.height*0.3,
            child: Image(image: AssetImage("comp/logo.png"),),),),
          Positioned(top: MediaQuery.of(context).size.height*0.03,left:MediaQuery.of(context).size.width*0.03 ,child: IconButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return Secondpage();
            }));
          },icon: Icon(Icons.arrow_back_ios,size: MediaQuery.of(context).size.height * 0.05,),))],
        )
        ,Container(padding: EdgeInsets.only(right: 10),height: MediaQuery.of(context).size.height * 0.1,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          ,child: Center(
            child: Directionality(textDirection: TextDirection.rtl,child:
            TextFormField(style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.028),controller: name,validator: validatename,decoration: InputDecoration(hintText: "اسم الحساب",suffixIcon:Icon(Icons.people,color: Colors.blue,) ,border: InputBorder.none),)),
          ),),Container(padding: EdgeInsets.only(right: 10),height: MediaQuery.of(context).size.height * 0.1,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          ,child: Center(
            child: Directionality(textDirection: TextDirection.rtl,child:
            TextFormField(style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.028,),textDirection: TextDirection.ltr,obscureText: true,validator: validatepassword,controller: password,decoration: InputDecoration(hintText: "كلمة السر",suffixIcon:Icon(Icons.lock,color: Colors.blue,) ,border: InputBorder.none),)),
          ),),Container(padding: EdgeInsets.only(right: 10),height: MediaQuery.of(context).size.height * 0.1,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          ,child: Center(
            child: Directionality(textDirection: TextDirection.rtl,child:
            TextFormField(style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.028),textDirection: TextDirection.ltr,obscureText: true,validator: validatepasswordre,controller: repassword,decoration: InputDecoration(hintText: "تأكيد كلمة السر",suffixIcon:Icon(Icons.lock,color: Colors.blue,) ,border: InputBorder.none),)),
          ),),Container(padding: EdgeInsets.only(right: 10),height: MediaQuery.of(context).size.height * 0.1,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          ,child: Center(
            child: Directionality(textDirection: TextDirection.rtl,child:
            TextFormField(style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.028),textDirection: TextDirection.ltr,controller: email,validator: validateemail,decoration: InputDecoration(hintText: "البريد الالكتروني",suffixIcon:Icon(Icons.mail,color: Colors.blue,) ,border: InputBorder.none),)),
          ),),
        Container(padding: EdgeInsets.only(right: 10),height: MediaQuery.of(context).size.height * 0.1,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          ,child: Center(
            child: Directionality(textDirection: TextDirection.rtl,child:
            TextFormField(style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.028),controller: phone,validator: validatepassword,keyboardType: TextInputType.number,decoration: InputDecoration(hintText: "رقم الهاتف",suffixIcon:Icon(Icons.phone,color: Colors.blue,) ,border: InputBorder.none),)),
          ),),Container(alignment: Alignment.centerRight,height: MediaQuery.of(context).size.height * 0.09,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          , child: Directionality(textDirection: TextDirection.rtl,child:
            InkWell(onTap:viewmorefeat,child: ListTile(trailing: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.blue,size: MediaQuery.of(context).size.height*0.05 ,),title: Text("حساب مميز",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),)))),
          ),
        Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.1,top:MediaQuery.of(context).size.width * 0.06 ,left: MediaQuery.of(context).size.width * 0.25,right:MediaQuery.of(context).size.width * 0.25 ),height: MediaQuery.of(context).size.height * 0.07,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),child:Center(child : InkWell(onTap: signup,child: Text("تسجيل",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height* 0.025)))) ),

      ],),
    ) ,);
  }
}
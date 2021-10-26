import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'as http;
import 'package:teste/mainpage.dart';
import 'package:teste/sign%20up.dart';
class Secondpage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return Secondstate();
  }
}
class Secondstate extends State<Secondpage>{
  GlobalKey<FormState> key = new GlobalKey<FormState>();
  static String validatepassword(String value) {
    if(value.isEmpty){
      return 'Password can\'t be empty' ;
    }
    return null;
  }
  static String validatphone(String value) {
    if(value.isEmpty){
      return 'Place name can\'t be empty';
    }
    return null;
  }
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void signwithfacebook(){


  }
  void signwithgoogle(){


  }
  void signin()async{
    if(!Value){
      if(key.currentState.validate()){
        //get all users to check
        var url = "";
        var response = await http.get(Uri.parse(url));
       var body = jsonDecode(response.body);
        List data = body;
        var phoneable =false;
        var passable =false;
        //put name here
        List phones =[];
        var index;
        List passwords =[];
        List usernames =[];
        List emails =[];
        for(int g =0 ;g<data.length;g++){
          phones.add(data[g][""]);
          passwords.add(data[g][""]);
          usernames.add(data[g][""]);
          emails.add(data[g][""]);
        }
        //check
        for (int s = 0; s < data.length; s++) {
          if (phones[s] == phone.text) {
            phoneable =true;
             index=s;
            if ( passwords[s]== password.text){
              passable = true;
            }
          }
        }
        //result
        if(phoneable ==false){
          return showDialog(context: context, builder: (context) {
            return AlertDialog(title: new Text("خطأ"),
                content: new Text("لا يوجد حساب بهذا الرقم!"),
                actions: [
                  new ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))
                ]);
          });
        }
        else if(phoneable ==true&&passable==false ){
          return showDialog(context: context, builder: (context) {
            return AlertDialog(title: new Text("خطأ"),
                content: new Text("كلمة السر خاطئة الرجاء اعادة المحاولة!"),
                actions: [
                  new ElevatedButton(onPressed:(){Navigator.of(context).pop();}, child: Text("ok"))
                ]);
          });
        }
        else if(phoneable==true && passable ==true){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return Mainpage(username: usernames[index],password: passwords[index],
            email: emails[index],phone: phones[index],);
          }));
        }
      }
    }
    else{
    }

  }

  var Value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Form(key: key,
      child: ListView(children: [
        Center(child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),width: MediaQuery.of(context).size.width * 0.5,height: MediaQuery.of(context).size.height*0.3,
        child: Image(image: AssetImage("comp/logo.png"),),),)
        ,Container(padding: EdgeInsets.only(right: 10),height: MediaQuery.of(context).size.height * 0.09,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          ,child: Center(
            child: Directionality(textDirection: TextDirection.rtl,child:
            TextFormField(controller: phone,validator: validatphone,style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.028),decoration: InputDecoration(hintText: "رقم الهاتف",suffixIcon:Icon(Icons.phone,color: Colors.blue,) ,border: InputBorder.none),)),
          ),),Container(padding: EdgeInsets.only(right: 10),height: MediaQuery.of(context).size.height * 0.09,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05
            ,right:MediaQuery.of(context).size.width * 0.08,left: MediaQuery.of(context).size.width * 0.08 ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white)
          ,child: Center(
            child: Directionality(textDirection: TextDirection.rtl,child:
            TextFormField(controller: password,validator: validatepassword,style: TextStyle(fontSize: MediaQuery.of(context).size.height* 0.028),obscureText: true,decoration: InputDecoration(hintText: "كلمة السر",suffixIcon:Icon(Icons.lock,color: Colors.blue,) ,border: InputBorder.none),)),
          ),),
        Container(margin: EdgeInsets.only( top: MediaQuery.of(context).size.width*0.05,left:MediaQuery.of(context).size.width*0.1 ,right : MediaQuery.of(context).size.width*0.08),alignment: Alignment.centerRight,child: Directionality(textDirection: TextDirection.rtl
            ,child: CheckboxListTile(value: Value,title: Text("نسيت كلمة السر",style: TextStyle(fontSize:MediaQuery.of(context).size.height* 0.025,color: Colors.black38),), onChanged: (bool value) {setState(() {Value = value;});  },)),),
        Container(margin: EdgeInsets.only(top:MediaQuery.of(context).size.width * 0.06 ,left: MediaQuery.of(context).size.width * 0.25,right:MediaQuery.of(context).size.width * 0.25 ),height: MediaQuery.of(context).size.height * 0.07,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),child:Center(child : InkWell(onTap: signin,child: Text("دخول",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height* 0.025)))) ),
        Container(margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),child: Divider(thickness: 1,color: Colors.black,),),
        Container(child: Center(child: InkWell(onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return Signup();
          }));
        },child: Text("تسجيل حساب جديد",style: TextStyle(fontSize:MediaQuery.of(context).size.height* 0.025),)),),),
        Container(margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.height * 0.05 ,top: MediaQuery.of(context).size.height * 0.03),child: Row(children: [Expanded(flex: 2,child: Container(),),Expanded(child:Container(height: 70,child: Column(children: [Container(width: MediaQuery.of(context).size.width*0.1,height:MediaQuery.of(context).size.width*0.1 ,child :InkWell(onTap: signwithfacebook,child: Image(image: AssetImage("comp/face.png") ,))),Text("فيسبوك")]))),Expanded(child:Container(height: 70,child :  Column(children: [Container(width: MediaQuery.of(context).size.width*0.1,height:MediaQuery.of(context).size.width*0.1 ,child :InkWell(onTap: signwithgoogle,child: Image(image: AssetImage("comp/google.png") ,))),Text("جوجل")]))),Expanded(flex: 2,child: Container())],),)

      ],),
    ) ,);
  }
}
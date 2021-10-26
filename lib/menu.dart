import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/main.dart';
import 'package:teste/mainpage.dart';
import 'package:teste/secondpage.dart';

class Menu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Statemenu();
  }
}
class Statemenu extends State<Menu>{
  void signout()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
      return MyApp();
    }));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Container(color: Colors.white,
        child: Stack(children: [Container(),
        Positioned(top:MediaQuery.of(context).size.height*0.1,width: MediaQuery.of(context).size.width ,child:Container(decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),height: MediaQuery.of(context).size.height*0.9,
          child: ListView(children: [
            Container(width: MediaQuery.of(context).size.width*0.4,height:MediaQuery.of(context).size.width*0.4,child: Image(image: AssetImage("comp/logo.png"),),),
            Directionality(textDirection: TextDirection.rtl,child: InkWell(onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                return Mainpage();
              }));
            },child: Container(margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05, left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("الصفحة الرئيسية",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.home,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),))))
            ,Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: Divider(color: Colors.blue,thickness: 1,),)
,Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only( left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("من نحن",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.assignment_outlined,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),)))
            ,Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: Divider(color: Colors.blue,thickness: 1,),),Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only( left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("تواصل معنا",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.call,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),)))
            ,Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: Divider(color: Colors.blue,thickness: 1,),),Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only( left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("سلة المشتريات",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.shopping_cart,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),)))
            ,Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: Divider(color: Colors.blue,thickness: 1,),),
            Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only( left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("الصيانة الفورية",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.home_repair_service,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),)))
            ,Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: Divider(color: Colors.blue,thickness: 1,),),
            Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("بروفايل",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.person,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),)))
            ,Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: Divider(color: Colors.blue,thickness: 1,),),
            Directionality(textDirection: TextDirection.rtl,child: Container(margin: EdgeInsets.only( left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("عقود الصيانة",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.handyman_sharp,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),)))
            ,Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: Divider(color: Colors.blue,thickness: 1,),),
            Directionality(textDirection: TextDirection.rtl,child: InkWell(onTap: signout,child: Container(margin: EdgeInsets.only( bottom: MediaQuery.of(context).size.width*0.1,left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),child: ListTile(title:Text("تسجيل الخروج",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.height*0.03),),trailing: Icon(Icons.logout,color: Colors.blue,size:  MediaQuery.of(context).size.height*0.05,),))))


          ],)))

        ],),
      ),
    );
  }
}
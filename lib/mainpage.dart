import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teste/menu.dart';
class Mainpage extends StatefulWidget{
  var password ;
  var phone ;
  var email ;
  var username;
  Mainpage({this.password,this.email,this.phone,this.username});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Statemain(username: username,email : email , phone : phone,
        password : password);
  }
}
class Statemain extends State<Mainpage>{
  var password ;
  var phone ;
  var email ;
  var username;
  Statemain({this.password,this.email,this.phone,this.username});
  List Urls =[];
  List nameofproduct = [];
  List prices = [];
  List colors =[];
  List brands =[];
  List dim =[];
  List data = [];
  getuser()async{
    if(username !=null){
      saved();
      getdata();
    }
    else{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      username = sharedPreferences.getString("username");
      email = sharedPreferences.getString("email");
      password = sharedPreferences.getString("password");
      phone = sharedPreferences.getString("phone");
      getdata();
    }
  }
  void saved() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.setString("username", username.toString());
    sharedPreferences.setString("email", email.toString());
    sharedPreferences.setString("phone", phone.toString());
    sharedPreferences.setString("password", password.toString());
    print("okay");
  }
  void getdata() async{
    //put the url of api here
    var url = "";
    var response = await http.get(Uri.parse(url));
    var body = jsonDecode(response.body);
    data =body;
    //note : you should name the gabs with the right names from api
    if(data.length != 0) {
      for (int i = 0; i < data.length; i++) {
        Urls.add(data[i]["url"]);
        prices.add(data[i]["prices"]);
        nameofproduct.add(data[i]["name"]);
      }
    }
    setState(() {});
  }
  @override
  void initState() {
    getuser();
    print(username);
    print(password);
    print(phone);
    print(email);
    //print(data.length);
    super.initState();
  }
  //var list = ["comp/image1.png","comp/image2.png","comp/image3.png"];
  int activee = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(body:  ListView(
     children: [Container(margin: EdgeInsets.all(20),height: MediaQuery.of(context).size.height * 0.1,width: MediaQuery.of(context).size.width*0.15
         ,child: Row(children: [Expanded(child: Container(height:MediaQuery.of(context).size.width * 0.9 ,width: MediaQuery.of(context).size.width * 0.9,child: Image(fit: BoxFit.fill,image: AssetImage("comp/logo.png"),),)),
           Expanded(flex: 6,child:  Container(margin: EdgeInsets.only(left: 10),child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.search),border: InputBorder.none),),decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(20)),)),
           Expanded(child: Container(child: IconButton(icon: IconButton(icon: Icon(Icons.menu,color: Colors.blue,size: 30,),onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return Menu();
             }));},),),))],)),
    Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height* 0.2,child: Image(fit: BoxFit.fill,image: AssetImage("comp/image1.png"),),)
    ,Container(
      child:data.length == 0 ? Container(height: MediaQuery.of(context).size.height*0.35,child: Center(child : Text("لا يوجد هناك شئ لعرضه"))): Container(height: MediaQuery.of(context).size.height*0.75,
           child: GridView.builder(scrollDirection: Axis.horizontal,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
             itemCount: data.length, itemBuilder: (context,i){
               return Container(margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),decoration: BoxDecoration(  boxShadow: [
                 BoxShadow(
                   color: Colors.black26,
                   blurRadius: 1.0,
                   spreadRadius: 0.0,
                   offset: Offset(2.0, 2.0), // shadow direction: bottom right
                 )
               ],color: Colors.white,borderRadius: BorderRadius.circular(20)),width: MediaQuery.of(context).size.width * 0.2,height: MediaQuery.of(context).size.height*0.2,
               child: Column(children: [
                 Container(height: MediaQuery.of(context).size.height*0.25,child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)),child: Image(fit: BoxFit.fill,image: NetworkImage(Urls[i]),)),)
                 ,Container(child: Row(children: [Expanded(child :Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.025),alignment: Alignment.centerLeft,child: Text(prices[i] + ": سعر",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025,color: Colors.blue),),)),Expanded(child: Container(margin: EdgeInsets.only(right: MediaQuery.of(context).size.height*0.025),alignment: Alignment.centerRight,child: Text(nameofproduct[i],style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025,color: Colors.blue),)),)],),),
                 Container(child: Row(children: [Expanded(child: Container()),Expanded(child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.025),alignment: Alignment.centerLeft,child: Icon(Icons.indeterminate_check_box,color: Colors.blue,),)),Expanded(child: Container(margin: EdgeInsets.only(right: MediaQuery.of(context).size.height*0.025),alignment: Alignment.centerRight,child: Icon(Icons.add_box_sharp,color: Colors.blue,)),),Expanded(child: Container())],),)

               ],),);
           },
           ),
         ),
    ),
       Container(height: MediaQuery.of(context).size.height *0.15,child: Row(children: [Expanded(child: Container()),Expanded(flex: 2,child: Container(width: 200,height: MediaQuery.of(context).size.height * 0.07,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),child:Center(child : InkWell(onTap: (){},child: Text("طلب خدمة",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height* 0.025)))) )),Expanded(child: Container()),
         Expanded(flex: 2,child: Container(height: MediaQuery.of(context).size.height * 0.07,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),child:Center(child : InkWell(onTap: (){},child: Text("تواصل معنا",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height* 0.025)))) )),Expanded(child: Container())],),)
       ,Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.12,decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),color: Colors.black87),child: Row(children: [
         Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group4.png"),))),
         Container(margin: EdgeInsets.only(top: 10,bottom: 10),child: VerticalDivider(color: Colors.white,thickness: 2,))
         ,Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group2.png"),))),
         Container(margin: EdgeInsets.only(top: 10,bottom: 10),child: VerticalDivider(color: Colors.white,thickness: 2,))
         ,Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group5.png"),))),
         Container(margin: EdgeInsets.only(top: 10,bottom: 10),child: VerticalDivider(color: Colors.white,thickness: 2,))
         ,Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group3.png"),)))
       ],),)
     ],
   ),);
  }
}
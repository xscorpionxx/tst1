

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Firstpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Statefirst();
  }
}
class Statefirst extends State<Firstpage>{
  List Urls =[];
  List nameofproduct = [];
  List prices = [];
  List colors =[];
  List brands =[];
  List dim =[];
  List data = [];
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
       prices.add(data[i]["price"]);
       nameofproduct.add(data[i]["name"]);
       colors.add(data[i]["color"]);
       brands.add(data[i]["brand"]);
       dim.add(data[i]["dim"]);
     }
   }
   setState(() {});
 }
 @override
  void initState() {
    getdata();
    //print(data.length);
    super.initState();
  }
  //var list = ["comp/image1.png","comp/image2.png","comp/image3.png"];
  int activee = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: ListView(
      children: [Container(margin: EdgeInsets.all(20),height: MediaQuery.of(context).size.height * 0.1,width: MediaQuery.of(context).size.width*0.15
          ,child: Row(children: [Expanded(child: Container(height:MediaQuery.of(context).size.width * 0.9 ,width: MediaQuery.of(context).size.width * 0.9,child: Image(fit: BoxFit.fill,image: AssetImage("comp/logo.png"),),)),
            Expanded(flex: 6,child:  Container(margin: EdgeInsets.only(left: 10),child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Icons.search),border: InputBorder.none),),decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(20)),)),
            Expanded(child: Container(child: IconButton(icon: Icon(Icons.menu,size: 30,color: Colors.blue,),),))],)),
        Container(height: MediaQuery.of(context).size.height*0.7,
        child:data.length == 0 ? Container(child: Center(child : Text("there is no thing to show")),) :  ListView(children: [
          Container(margin: EdgeInsets.all(20),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),width: MediaQuery.of(context).size.width ,height:MediaQuery.of(context).size.height * 0.5 ,
            child: Stack(
              children:[CarouselSlider.builder(options: CarouselOptions(height: MediaQuery.of(context).size.height*0.45,
                  onPageChanged: (ind,reson){
                 setState(() {
                   activee = ind;
                 });
                  }
              ,autoPlay: true),
        itemBuilder: (context,index , real){
                return Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width* 0.09,right: MediaQuery.of(context).size.width* 0.09),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.3,child: Image(fit:BoxFit.fill,image: NetworkImage(Urls[activee]),));
        },itemCount: data.length,),
                Positioned(bottom: MediaQuery.of(context).size.height*0.25,right:MediaQuery.of(context).size.width*0.5,child: Container(width: MediaQuery.of(context).size.width*0.5,height:
                MediaQuery.of(context).size.width*0.5,
                  child: Image(image: AssetImage("comp/50-percent.png"),),))],
            ),
          ),
          Container(child: data.length!= 0 ? Center(
            child: AnimatedSmoothIndicator(count: data.length,
                activeIndex:activee ,),
          ) : Container(),),
          Container(margin: EdgeInsets.only(top: 30),child: Center(child: Text(nameofproduct[activee],style: TextStyle(fontSize: 20,color: Colors.black38),)),),
          Container(margin: EdgeInsets.only(top: 30,left: MediaQuery.of(context).size.width *0.07),child: Row(children: [Text("Price : ",style: TextStyle(fontSize: 20,color: Colors.lightBlue),),Text(prices[activee],style: TextStyle(fontSize: 20,color: Colors.lightBlue),)],)),
          Container(margin: EdgeInsets.only(top: 20,left: MediaQuery.of(context).size.width *0.07),child: Row(children: [Text("Color : ",style: TextStyle(fontSize: 20,color: Colors.black38),),Text(colors[activee],style: TextStyle(fontSize: 20,color: Colors.black38),)],)),
          Container(margin: EdgeInsets.only(top: 10,left: MediaQuery.of(context).size.width *0.07),child: Row(children: [Text("Brand : ",style: TextStyle(fontSize: 20,color: Colors.black38),),Text(brands[activee],style: TextStyle(fontSize: 20,color: Colors.black38),)],)),
          Container(margin: EdgeInsets.only(top: 10,left: MediaQuery.of(context).size.width *0.07),child: Row(children: [Text("item Dimensions LxWxH : ",style: TextStyle(fontSize: 20,color: Colors.black38),),],)),
          Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1,top: 5,left: MediaQuery.of(context).size.width *0.07),child: Text(dim[activee],style: TextStyle(fontSize: 20,color: Colors.black38),))
        ],),
      ),
      Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.12,decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),color: Colors.black87),child: Row(children: [
      Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group4.png"),))),
        Container(margin: EdgeInsets.only(top: 10,bottom: 10),child: VerticalDivider(color: Colors.white,thickness: 2,))
        ,Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group2.png"),))),
        Container(margin: EdgeInsets.only(top: 10,bottom: 10),child: VerticalDivider(color: Colors.white,thickness: 2,))
        ,Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group5.png"),))),
        Container(margin: EdgeInsets.only(top: 10,bottom: 10),child: VerticalDivider(color: Colors.white,thickness: 2,))
        ,Expanded(child:Container(width: 50,height: 50,child : Image(image: AssetImage("comp/Group3.png"),)))
      ],),)
      ],
    ));
  }

}

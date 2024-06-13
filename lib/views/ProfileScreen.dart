///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:0,
centerTitle:true,
automaticallyImplyLeading: false,
backgroundColor:Color(0xffffffff),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Profile",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
leading: Icon(
Icons.list,
color:Color(0xff000000),
size:24,
),
),
body:Padding(
padding:EdgeInsets.all(16),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Container(
height:80,
width:80,
clipBehavior: Clip.antiAlias,
decoration: BoxDecoration(
shape: BoxShape.circle,
),
child:Image.network(
 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMBF7GiWBnuwHZEoUkGAktUZR91Ge2bVJ9rhYg7-YRz0M7tdM-8Os4tSZno4Jd6j5p9p8&usqp=CAU",
fit:BoxFit.cover),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 16,horizontal:0),
child:Text(
"Robert Fox",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 16),
child:Row(
mainAxisAlignment:MainAxisAlignment.spaceEvenly,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children:[


Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"17",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xffff5630),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
child:Text(
"Article",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"412",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xffff5630),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
child:Text(
"Followers",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"17",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xffff5630),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
child:Text(
"Following",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),
],),),
Divider(
color:Color(0xffd5d5d5),
height:16,
thickness:0.5,
indent:0,
endIndent:0,
),
Padding(
padding:EdgeInsets.symmetric(vertical: 8,horizontal:0),
child:Align(
alignment:Alignment.centerLeft,
child:Text(
"All Article",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
),

ListView(
scrollDirection: Axis.vertical,
padding:EdgeInsets.all(0),
shrinkWrap:true,
physics:NeverScrollableScrollPhysics(), 
children:[

Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children:[

ClipRRect(
borderRadius:BorderRadius.circular(12.0),
child:
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmRLIAVdwC2OswUAfVokdopnLTYy810FTDBA&usqp=CAU"),
height:100,
width:100,
fit:BoxFit.cover,
),
),
Expanded(
flex: 1,
child: Padding(
padding:EdgeInsets.fromLTRB(8, 0, 0, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"Sports",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xffff5630),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 4, 0, 0),
child:Text(
"The latest football boots from Adidas. Lighter than before.",
textAlign: TextAlign.start,
maxLines:3,
overflow:TextOverflow.ellipsis,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"20 Jan 2021",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xbe8a8989),
),
),
),
],),),),
Icon(
Icons.more_vert,
color:Color(0xff212435),
size:24,
),
],),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children:[

ClipRRect(
borderRadius:BorderRadius.circular(12.0),
child:
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKB_1ZbCfGHaLemCF311AbIDW2sXnr1xElag&usqp=CAU"),
height:100,
width:100,
fit:BoxFit.cover,
),
),
Expanded(
flex: 1,
child: Padding(
padding:EdgeInsets.fromLTRB(8, 0, 0, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"Entertainment",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xffff5630),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 4, 0, 0),
child:Text(
"The big concert that will be held soon in 2021.",
textAlign: TextAlign.start,
maxLines:3,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"11 Jan 2021",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xbe8a8989),
),
),
),
],),),),
Icon(
Icons.more_vert,
color:Color(0xff212435),
size:24,
),
],),),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children:[

ClipRRect(
borderRadius:BorderRadius.circular(12.0),
child:
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG-k6ttlnJJP7aF8ZZy-81pux2u0QaXin1uQ&usqp=CAU"),
height:100,
width:100,
fit:BoxFit.cover,
),
),
Expanded(
flex: 1,
child: Padding(
padding:EdgeInsets.fromLTRB(8, 0, 0, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"Automative",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xffff5630),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 4, 0, 0),
child:Text(
"The classic car make you look cooler.Let's see!",
textAlign: TextAlign.start,
maxLines:3,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
child:Text(
"29 Dec 2021",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xbe8a8989),
),
),
),
],),),),
Icon(
Icons.more_vert,
color:Color(0xff212435),
size:24,
),
],),),
],),
],),),),
)
;}
}
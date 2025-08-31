import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled/function.dart';

void main() {
  runApp(Home());
}

var butoperators =["÷","*","+","=","-"];
var simp=["AC","⌫","%"];

String inputval = "";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget calcButtons(String Text1,Color color1,Color color2,double size1,double tsize,onpress){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 06,vertical: 6),
      child: SizedBox(
         height: 75,
         width: size1,
             child: ElevatedButton(onPressed:onpress,style:ElevatedButton.styleFrom(
               backgroundColor: color1,
               foregroundColor: color2,
               shape: RoundedRectangleBorder(borderRadius:BorderRadiusGeometry.circular(size1)),
               padding: const EdgeInsets.only(left: .5,top: .5,right: .5,bottom: .5),),
                 child: Text(
                   "${Text1}",
                   style:TextStyle(fontSize: tsize,fontWeight: FontWeight.bold),
                 )
             ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final screenwidh = MediaQuery.of(context).size.width;

    return MaterialApp(theme: ThemeData(scaffoldBackgroundColor:Colors.white30 ),
       home: Scaffold(
        body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 30 ),

        child: Column(
          crossAxisAlignment:CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
              children: [

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text( inputval,style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold,color: Colors.white),)),

             SizedBox(height: 35,),
                for (var row in [
                  ["AC","⌫","%", "÷",],
                  ["7", "8", "9","*"],
                  ["4", "5", "6","-"],
                  ["1", "2", "3","+"],
                  ["0" , ".", "="]])
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: row.map((value) {
                      final myfun = Myfunction();

                      return calcButtons("${value}",butoperators.contains(value) ?  Colors.orangeAccent : simp.contains(value) ? Colors.white :Colors.black26, Colors.black, value != "0" ?90:180 ,30,()
                      {
                        var result =  Myfunction.appendInput(value,setState);
                        setState(() {
                          inputval=result;
                        });

                      }
                      );}).toList(),
                  ),
              ],
            ),
      )
      )
    );

  }
}

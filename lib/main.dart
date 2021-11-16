import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}


class MyHomePage extends StatefulWidget{
    @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

//root widget
//cannot directly used showDialog in root widget
class MyHomePageState extends State<MyHomePage>{

  var key = 0;


  Widget build(BuildContext context){  //when call setState ,rerun build method//recreate widget

    print("Build Method");

    return MaterialApp(
      home: Scaffold(  
        appBar: AppBar(title: Text("My App"),),
        body: MyHome()


      ),
    );
  }
}

//create another widget
class MyHome extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(child: 
    OutlinedButton(    
      onPressed: (){
       Future data =  showDialog(
        context:   context,
         builder: (BuildContext con){
           return SimpleDialog(
             children: [
               SimpleDialogOption(child: Text("Dell"),
               onPressed: (){
                 Navigator.pop(context, "Dell");
               } ),
               SimpleDialogOption(child: Text("Lenovo"),
               onPressed: (){
                 Navigator.pop(context, "Lenovo");
               }  ),
             ]
           );
         });

         data.then( (value){
           print(value);
         } );

      },
      child: Text("Click"),
    ),);
  }
}



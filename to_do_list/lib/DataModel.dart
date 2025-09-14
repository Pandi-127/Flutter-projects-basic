import 'package:flutter/material.dart';


                       //TODO"s LIST
class TodoList {
  String toDo;
  bool isDone;


  TodoList({
    required this.toDo,
    this.isDone = false,

  });


  static List<TodoList> _toDosList= [
      TodoList(toDo: "Buy coffee", isDone: true),
    TodoList(toDo: "Walk dog",isDone: false,),
  ];
  static List<TodoList> toDosList() {
    return _toDosList ;
  }


 static void AddNewToDo(String value) {
    _toDosList.add(TodoList(toDo: value,isDone: false),);
  }//COLOR
  static void deleteNode(int index) {
    if (index >= 0 && index < _toDosList.length) {
      _toDosList.removeAt(index);
    }
  }
  static String? searchnode(String value){
    int i =0;
    for (i;_toDosList.length>i;i++){
     if(_toDosList[i].toDo=="$value"){
       return "fount at $i";
     }
     }
    return"Not Fount";
    }
  }





class AppColors {
  static const Color primary = Color(0xFFDEDFE4);
  static const Color secondary = Color(0xFF2828AB);
  static const Color third = Color(0xFF7B60B8);
  static const Color TranperantWhite = Color(0x84FDFDFD);
}
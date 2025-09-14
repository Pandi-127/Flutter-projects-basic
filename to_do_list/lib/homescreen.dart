import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/DataModel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController mycontroller = TextEditingController();
  final TextEditingController searchController = TextEditingController();


  bool showSearch = true;

  @override
  Widget build(BuildContext context) {
    final todos = TodoList.toDosList();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.primary,
        floatingActionButton: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: mycontroller,
                  decoration: InputDecoration(
                    hintText: "Add a New Task",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.third),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.third),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  TodoList.AddNewToDo(mycontroller.text);
                  mycontroller.clear();
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
        appBar: AppBar(
          titleSpacing: 125,
          titleTextStyle: TextStyle(
            fontSize: 30,
            color: AppColors.third,
            fontWeight: FontWeight.bold,
          ),
          title: const Text("ALL TODO"),
          backgroundColor: AppColors.primary,
          actionsPadding: const EdgeInsets.symmetric(horizontal: 5),
          actions: [
          ],
          toolbarHeight: 100,
        ),

        body: Column(
          children: [


              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search your tasks...",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.third),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.third),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onSubmitted: (value){
                  print(TodoList.searchnode(searchController.text));
                  searchController.clear();


                  },
                ),
              ),


            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todos[index];

                  return Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                TodoList.deleteNode(index);
                              });
                            },
                            icon: Icons.delete,
                            borderRadius: BorderRadius.circular(20),
                            backgroundColor: AppColors.TranperantWhite,
                          )
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.third,
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: AppColors.third,
                              activeColor: AppColors.primary,
                              side: const BorderSide(color: Colors.white),
                              value: todo.isDone,
                              onChanged: (value) {
                                setState(() {
                                  todo.isDone = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                todo.toDo,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  decoration: todo.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  decorationThickness: 2,
                                  decorationColor: Colors.white,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

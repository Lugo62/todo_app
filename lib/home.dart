import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_controller.dart';

import 'dart:math';

class Home extends StatelessWidget {
  Home({super.key});

  final colors = [
  Colors.red.shade200,
  Colors.blue.shade200,
  Colors.green.shade200,
  Colors.orange.shade200,
  Colors.purple.shade200,
];

  TextEditingController ttc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final datastored = context.watch<TodoController>();
    return Scaffold(
      body: ListView.builder(
        itemCount: datastored.todolist.length,
        itemBuilder: (context, index) {
          return Card(
            
            color: colors[Random().nextInt(colors.length)],


            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: ListTile(
              leading: Checkbox(
                activeColor: const Color.fromARGB(255, 0, 0, 0),
                checkColor: Colors.white,

                value: datastored.todolist[index].isdone,
                onChanged: (value) {
                  context.read<TodoController>().completed(
                    datastored.todolist[index],
                  );
                },
              ),

                 trailing:  SizedBox(
                  width: 30,
                   child: IconButton(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                 ),
                
              
              title: Text(datastored.todolist[index].title,
              style: TextStyle(
                decoration: datastored.todolist[index].isdone
                ?TextDecoration.lineThrough:
                null,
              ),),
            ),
          );
        },
      ),

      backgroundColor: const Color.fromARGB(255, 44, 44, 44),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,

        title: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            children: [
              Text(
                "Notes",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 33),
              ),

              const Spacer(),

              Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(18),
          ),
        ),
      ),

      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Form(
                  child: AlertDialog(
                    title: Text(
                      "Add New Task",
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: ttc,
                            decoration: InputDecoration(
                              hintText: "Task title",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 30),

                          SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  0,
                                  0,
                                ),
                                foregroundColor: Colors.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                context.read<TodoController>().addtodo(
                                  ttc.text,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  (SnackBar(content: Text("Task added!"))),
                                );

                                ttc.clear();
                                Navigator.pop(context);
                              },
                              child: Text(
                                "ADD",

                                style: GoogleFonts.chelseaMarket(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),

      //body
    );
  }
}

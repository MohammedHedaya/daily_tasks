// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_print

import 'package:daily_tasks/models/task_data.dart';
import 'package:daily_tasks/screens/add_task_screen.dart';
import 'package:daily_tasks/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
           context: context,
           builder: (context) => SingleChildScrollView(
             child: Container(
             padding: EdgeInsets.only(
               bottom: MediaQuery.of(context).
               viewInsets.bottom),
               child: AddTaskScreen((newTaskTitle){
                 // setState(() {
                 //   tasks.add(Task(name: newTaskTitle));
                 //   Navigator.pop(context);
                 // });
               }),
            ),
           ),
          );
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 20,),
                Text('Daily TaskS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              '${Provider.of<TaskData>(context).tasks.
              length}TASKS',
              style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            ),
            SizedBox(height: 13,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



import 'dart:developer';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/const.dart';
import 'package:todo_app/screen/addTask/provider.dart';
import 'package:todo_app/screen/addTask/widget/widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<addTaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Todays Task',
          style: TextStyle(color: AppConst.lightWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create\nNew Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Task title',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              TextFormField(
                controller: prov.titleController,
                cursorColor: Colors.grey,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: 'Enter title',
                    hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.normal),
                    focusColor: AppConst.lightGreenAccent,
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.4)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.4)),
                    )),
              ),
              const SizedBox(height: 20),
              const Text(
                'CO Worker',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: 370,
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: GestureDetector(
                                onTap: () {
                                  prov.addImage(i);
                                  log("first ${prov.imagePic}");
                                  prov.imagePic.removeLast();
                                },
                                child: CircleAvatar(
                                  radius: 26,
                                  backgroundImage:
                                      NetworkImage(prov.workers[i]),
                                ),
                              ),
                            );
                          }),
                    ),
                    const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.add, color: AppConst.lightGreenAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customContainer(
                    icon: Icons.access_time,
                    title: 'Task Start',
                    func: () {
                      prov.startDate(context);
                    },
                    time: prov.startTime.isEmpty ? 'Pick' : prov.startTime,
                  ),
                  customContainer(
                    icon: Icons.access_time,
                    title: 'Task End',
                    func: () {
                      prov.endDate(context);
                    },
                    color: Colors.red,
                    time: prov.endTime.isEmpty ? 'Pick' : prov.endTime,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Descriptions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 0.4,
                  
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: prov.descriptionController,
                  maxLines: 10,
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                      hintText: "Description.....",
                      hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.5), fontSize: 14),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              const SizedBox(height: 14),
              customButton(buttonText: 'Create Task',func: (){
                prov.addTask();
                log("message: ${prov.data}");
              })
            ],
          ),
        ),
      ),
    );
  }
}

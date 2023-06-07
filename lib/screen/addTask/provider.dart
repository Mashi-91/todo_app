import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/common/model/model.dart';
import 'package:todo_app/screen/home/provider/provider.dart';

class addTaskProvider extends HomeProvider {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var onChange = '';
  var imagePic = [];
  List<TaskModel> data = [];
  var startTime = '';
  var endTime = '';

  var workers = [
    'https://images.unsplash.com/photo-1615109398623-88346a601842?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1488716820095-cbe80883c496?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=686&q=80',
    'https://images.unsplash.com/photo-1609505848912-b7c3b8b4beda?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80',
    'https://images.unsplash.com/photo-1605462863863-10d9e47e15ee?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1591084728795-1149f32d9866?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
    'https://images.unsplash.com/photo-1567515004624-219c11d31f2e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
  ];

  startDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2030))
        .then((value) {
      if (value == null) {
        return;
      }
      var time = DateFormat('dd.MM.yy').format(value);
      startTime = time;
      notifyListeners();
    });
  }

  endDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2030))
        .then((value) {
      if (value == null) {
        return;
      }
      var time = DateFormat('dd.MM.yy').format(value);
      endTime = time;
      notifyListeners();
    });
  }

  // Selecting Images
  addImage(val) {
    imagePic.add(val);
    notifyListeners();
  }

  addWorkers(add) {
    workers.add(add);
    notifyListeners();
  }

  createTask() {
    data.add(TaskModel(
      id: DateTime.now().toString(),
      title: titleController.text,
      description: descriptionController.text,
      startTaskTime: startTime,
      endTaskTime: endTime,
    ));
    notifyListeners();
  }

  onChangeFunc(val) {
    onChange = val;
    notifyListeners();
  }
}

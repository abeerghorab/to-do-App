import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo2/firebase_util.dart';
import 'package:todo2/model/task.dart';

class ListProvider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();
  getAllTaskFromFireStore() async {
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    //todo filter list (selected date)
    taskList = taskList.where((task) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date);
      if (selectedDate.day == dateTime.day &&
          selectedDate.month == dateTime.month &&
          selectedDate.year == dateTime.year) {
        return true;
      }
      return false;
    }).toList();
//todo sort task list(date)
    taskList.sort((Task task1, Task task2) {
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);
    });

    notifyListeners();
  }

  void changeSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }
}

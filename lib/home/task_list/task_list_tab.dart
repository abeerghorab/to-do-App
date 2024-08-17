import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo2/firebase_util.dart';
import 'package:todo2/home/task_list/item_task_list_widget.dart';
import 'package:todo2/model/task.dart';
import 'package:todo2/my_theme.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    getAllTaskFromFireStore();

    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(
              Duration(days: 365),
            ),
            lastDate: DateTime.now().add(
              Duration(days: 365),
            ),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {});
            }, //logic
            leftMargin: 20,
            monthColor: MyThemeData.blackColor,
            dayColor: MyThemeData.blackColor,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryLightColor,
            dotColor: MyThemeData.whiteColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemTaskListWidget(
                  task: taskList[index],
                );
              },
              itemCount: taskList.length,
            ),
          ),
        ],
      ),
    );
  }

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

    setState(() {});
  }
}

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo2/home/task_list/item_task_list_widget.dart';
import 'package:todo2/my_theme.dart';

class TaskListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(
              Duration(days: 365),
            ),
            lastDate: DateTime.now().add(
              Duration(days: 365),
            ),
            onDateSelected: (date) => print(date), //logic
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
                return ItemTaskListWidget();
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

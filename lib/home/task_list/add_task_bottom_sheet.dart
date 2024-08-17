import 'package:flutter/material.dart';
import 'package:todo2/firebase_util.dart';
import 'package:todo2/model/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = "";

  String description = "";
  DateTime selectedDate = DateTime.now();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add new Task",
              style: Theme.of(context).primaryTextTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter task title",
                    ),
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter task title"; //invalid
                      }
                      return null; //validate
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter task description",
                    ),
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter task description"; //invalid
                      }
                      return null; //validate
                    },
                    minLines: 4,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Select Date",
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                //show calender
                chooseDate();
              },
              child: Text(
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                style: Theme.of(context).primaryTextTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                addTask();
              },
              child: Text(
                "Add",
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void chooseDate() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formkey.currentState?.validate() == true) {
      //validate add
      Task task = Task(
        title: title,
        description: description,
        date: selectedDate.millisecondsSinceEpoch,
      );
      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),
          onTimeout: () {
        // Function:

        print('Task was added Successfully');

        Navigator.of(context).pop();
      });
    }
  }
}

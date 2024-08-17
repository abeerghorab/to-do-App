import 'package:flutter/material.dart';
import 'package:todo2/home/settings/settings_tab.dart';
import 'package:todo2/home/task_list/add_task_bottom_sheet.dart';
import 'package:todo2/home/task_list/task_list_tab.dart';
import 'package:todo2/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyThemeData.primaryLightColor,
        onPressed: () {
          addTaskBottomSheet();
        },
        child: Icon(
          Icons.add,
          color: MyThemeData.whiteColor,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: MyThemeData.whiteColor,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: SingleChildScrollView(
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_list.png"),
                  ),
                  label: "Task List"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_settings.png"),
                  ),
                  label: "Settings"),
            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    TaskListTab(),
    SettingsTab(),
  ];

  void addTaskBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskBottomSheet());
  }
}

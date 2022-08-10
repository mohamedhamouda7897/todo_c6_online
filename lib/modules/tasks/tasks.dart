import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_online/models/task_model.dart';
import 'package:todo_c6_online/modules/tasks/task_item.dart';

import 'package:todo_c6_online/utils/add_task_firebase.dart';

import 'package:todo_c6_online/shared/styles/my_theme.dart';


class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              if (date == null) return;
              selectedDate = date;
              setState(() {});
            },
            leftMargin: 20,
            monthColor: MyThemeData.BlackColor,//(dark mode change) (if)
            dayColor: MyThemeData.BlackColor,//(dark mode change) (if)
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: MyThemeData.WhiteColor,//(dark mode change) (if)
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en',
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: getTasksFromFirebaseUseingStream(selectedDate),
            builder: (contect, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              List<TaskModel> tasks = snapshot.data?.docs
                      .map((docSnap) => docSnap.data())
                      .toList() ??
                  [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItem(tasks[index]);
                },
                itemCount: tasks.length,
              );
            },
          ))
        ],
      ),
    );
  }
}

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_online/modules/tasks/task_item.dart';
import 'package:todo_c6_online/shared/styles/my_theme.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
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
            child: ListView.builder(
              itemBuilder: (c, index) {
                return TaskItem();
              },
              itemCount: 12,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_c6_online/models/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Container(
            height: 50,
            color: Theme.of(context).primaryColor,
            width: 4,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                taskModel.description,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 12),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}

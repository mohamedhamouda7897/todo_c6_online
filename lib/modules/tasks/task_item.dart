import 'package:flutter/material.dart';
import 'package:todo_c6_online/shared/styles/my_theme.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: MyThemeData.WhiteColor, borderRadius: BorderRadius.circular(8)),//color of container tasks(dark mode change)
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Container(
            height: 50,
            color: Color(0xFF5D9CEC),
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
                'Task Title',style: TextStyle(fontSize: 25,
                color: Color(0xFF5D9CEC),
                fontWeight: FontWeight.w400,),

              ),
              Row(
                children: [
                  Icon(Icons.access_time,size: 15),
                  Text(
                    'Task Title',style: Theme.of(context).textTheme.bodyText1

                  ),
                ],
              )
              
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
                color: Color(0xFF5D9CEC),
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

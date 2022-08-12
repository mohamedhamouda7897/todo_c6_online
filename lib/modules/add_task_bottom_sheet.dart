import 'package:flutter/material.dart';
import 'package:todo_c6_online/models/task_model.dart';

import '../shared/components/components.dart';
import '../utils/add_task_firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  AppLocalizations.of(context)!.add_new_task,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2

              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.title),
                      onChanged: (text) {
                        title = text;
                      },
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_task_title;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      maxLines: 4,
                      minLines: 4,

                      onChanged: (text) {
                        description = text;
                      },
                      decoration: InputDecoration(labelText: AppLocalizations.of(context)!.description),

                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_task_description;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                AppLocalizations.of(context)!.select_time,style:Theme.of(context).textTheme.headline2?.copyWith(fontSize: 17) ,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  OpenDatePicker();
                },
                child: Text(
                  '${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}',style:Theme.of(context).textTheme.headline2?.copyWith(fontSize: 17) ,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // local database /// mobile
                    // remote database  // online
                    TaskModel tas = TaskModel(
                        title: title,
                        description: description,
                        datetime: DateUtils.dateOnly(selectedDate)
                            .microsecondsSinceEpoch);
                    showLoading(context, '${AppLocalizations.of(context)!.loading}...');
                    addTaskFromFireBase(tas).then((value) {
                      hideLoadingDialog(context);
                      showMessage(context, AppLocalizations.of(context)!.added_succefully, 'Ok', () {
                        Navigator.pop(context);
                      });
                      Navigator.pop(context); // close bottom sheet
                    }).catchError((e) {
                      print(' error route $e');
                      hideLoadingDialog(context);
                    });
                  }
                },
                child: Text(AppLocalizations.of(context)!.add_task),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void OpenDatePicker() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (choosenDate != null) {
      selectedDate = choosenDate;
      setState(() {});
    }
  }
}

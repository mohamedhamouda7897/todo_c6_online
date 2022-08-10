import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c6_online/models/task_model.dart';

CollectionReference<TaskModel> getTasksFromFireStore() {
  return FirebaseFirestore.instance
      .collection('tasks')
      .withConverter<TaskModel>(
          fromFirestore: (snapshot, op) {
            return TaskModel.fromJson(snapshot.data()!);
          },
          toFirestore: (task, option) => task.toJson());
}

Future<void> addTaskFromFireBase(TaskModel task) {
  var TypeCollection = getTasksFromFireStore();
  var doc = TypeCollection.doc();
  task.id = doc.id;
  return doc.set(task);

  // id titile description isdone date
}

Future<QuerySnapshot<TaskModel>> getTasksFromFirebase(DateTime dateTime) {
  var tasks = getTasksFromFireStore();
  return tasks
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .get();
}

Stream<QuerySnapshot<TaskModel>> getTasksFromFirebaseUseingStream(
    DateTime dateTime) {
  var tasks = getTasksFromFireStore();
  return tasks
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

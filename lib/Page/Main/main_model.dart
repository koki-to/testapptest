import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testapptest/todo.dart';

class MainModel extends ChangeNotifier {
  List<Todo> todoList = [];

  Future getTodoList() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('todoList').get();
    final docs = snapshot.docs;
    this.todoList = docs.map((doc) => Todo(doc)).toList();
    notifyListeners();
  }

  void getTodoListRealTime() {
    final snapshots =
        FirebaseFirestore.instance.collection('todoList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.todoList = todoList;
      notifyListeners();
    });
  }

  void reload() {
    notifyListeners();
  }

  Future deleteCheckdItems() async {
    final checkedItems = todoList.where((todo) => todo.isDone).toList();
    final regerense =
        checkedItems.map((todo) => todo.documentReference).toList();

    final batch = FirebaseFirestore.instance.batch();

    regerense.forEach((regerens) {
      batch.delete(regerens);
    });

    return batch.commit();
  }

  bool checkdActive() {
    final checkedItems = todoList.where((todo) => todo.isDone).toList();
    return checkedItems.length > 0;
  }
}

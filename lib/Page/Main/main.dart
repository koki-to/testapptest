import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapptest/Page/Main/main_model.dart';
import 'package:testapptest/Page/add_todo/add_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainModel()..getTodoListRealTime(),
      child: Consumer<MainModel>(builder: (context, model, snapshot) {
        final checkedActive = model.checkdActive();
        return Scaffold(
          appBar: AppBar(
            title: Text('Todoアプリ'),
            actions: [
              FlatButton(
                  onPressed: checkedActive
                      ? () async {
                          await model.deleteCheckdItems();
                        }
                      : null,
                  child: Text(
                    '完了',
                    style: TextStyle(
                        color: checkedActive ? Colors.white : Colors.grey),
                  ))
            ],
          ),
          body: ListView(
            children: model.todoList
                .map((todo) => CheckboxListTile(
                      title: Text(todo.title),
                      value: todo.isDone,
                      onChanged: (bool val) {
                        todo.isDone = !todo.isDone;
                        model.reload();
                      },
                    ))
                .toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPage(), fullscreenDialog: true),
              );
            },
          ),
        );
      }),
    );
  }
}

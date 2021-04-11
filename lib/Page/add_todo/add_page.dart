import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapptest/Page/add_todo/add_model.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddModel(),
      child: Consumer<AddModel>(builder: (context, model, snapshot) {
        return Scaffold(
          appBar: AppBar(title: Text('Todoの追加')),
          body: Column(
            children: <Widget>[
              SizedBox(height: 16),
              TextField(
                onChanged: (text) {
                  model.todoText = text;
                },
                decoration:
                    InputDecoration(labelText: '追加するTodo', hintText: 'ゴミを出す'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  child: Text('追加する'),
                  onPressed: () async {
                    await model.add();
                    Navigator.pop(context);
                  })
            ],
          ),
        );
      }),
    );
  }
}

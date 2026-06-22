// ignore_for_file: prefer_final_fields, avoid_print

import 'package:get/get_connect/connect.dart';
import 'package:todo_app/features/daily_rotine/data/model/todo_model.dart';

class TodoProvider extends GetConnect {
  List<TodoModel> _todoList = [
    TodoModel(id: 1, title: 'Clean Architecture শিখবো', isCompleted: false),
    TodoModel(id: 2, title: 'GetX প্র্যাকটিস করবো', isCompleted: true),
    TodoModel(id: 3, title: 'ইন্টারভিউ জিতবো!', isCompleted: false),
  ];
  Future<List<TodoModel>> fetchTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    return _todoList;
  }

  Future<void> addTodo(String title) async {
    await Future.delayed(const Duration(seconds: 2));
    final newTodo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      isCompleted: false,
    );
    _todoList.add(newTodo);
    print('ToDo List Update');
  }
}

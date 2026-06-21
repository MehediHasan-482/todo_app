import 'package:get/get_connect/connect.dart';
import 'package:todo_app/features/daily_rotine/data/model/todo_model.dart';

class TodoProvider extends GetConnect {
  Future<List<TodoModel>> fetchTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      TodoModel(
        id: 1,
        title: "This is the description of todo 1",
        isCompleted: false,
      ),
      TodoModel(id: 2, title: "Todo 2", isCompleted: true),
      TodoModel(
        id: 3,
        title: "This is the description of todo 3",
        isCompleted: false,
      ),
    ];
  }

  Future<TodoModel> addTodo(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    return TodoModel(
      id: id,
      title: "This is the description of todo $id",
      isCompleted: false,
    );
  }
}

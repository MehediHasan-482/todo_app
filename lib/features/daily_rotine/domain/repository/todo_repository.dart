import 'package:todo_app/features/daily_rotine/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodoList();
  Future<void> addTodo(String title);
}
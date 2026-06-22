import 'package:todo_app/features/daily_rotine/data/model/todo_model.dart';
import 'package:todo_app/features/daily_rotine/data/provider/todo_provider.dart';
import 'package:todo_app/features/daily_rotine/domain/entities/todo_entity.dart';
import 'package:todo_app/features/daily_rotine/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoProvider provider;
  TodoRepositoryImpl({required this.provider});

  @override
  Future<List<TodoEntity>> getTodoList() async {
    final List<TodoModel> todoModels = await provider.fetchTodos();
    return todoModels.map((model) => TodoEntity(
          id: model.id,
          title: model.title,
          isCompleted: model.isCompleted,
        ))
        .toList();
  }

  @override
  Future<void> addTodo(String title) async {
    await provider.addTodo(title);
  }
}
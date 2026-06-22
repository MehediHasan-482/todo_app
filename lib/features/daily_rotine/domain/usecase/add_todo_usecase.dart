import 'package:todo_app/features/daily_rotine/domain/repository/todo_repository.dart';

class AddTodoUseCase {
  final TodoRepository repository;
  AddTodoUseCase({required this.repository});

  Future<void> call(String title) async {
    await repository.addTodo(title);
  }
}
import 'package:todo_app/features/daily_rotine/domain/entities/todo_entity.dart';
import 'package:todo_app/features/daily_rotine/domain/repository/todo_repository.dart';

class GetTodoUsecase {
  final TodoRepository repository;
  GetTodoUsecase({required this.repository});

  Future<List<TodoEntity>> call() async {
    return await repository.getTodoList();
  }
}

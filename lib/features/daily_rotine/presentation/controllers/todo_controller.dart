import 'package:get/get.dart';
import 'package:todo_app/features/daily_rotine/domain/entities/todo_entity.dart';
import 'package:todo_app/features/daily_rotine/domain/usecase/add_todo_usecase.dart';
import 'package:todo_app/features/daily_rotine/domain/usecase/get_todo_usecase.dart';
class TodoController extends GetxController {
  final GetTodoUsecase getTodoUsecase;
  final AddTodoUseCase addTodoUseCase;
  TodoController({
    required this.getTodoUsecase,
    required this.addTodoUseCase,
  });

  var todolist = <TodoEntity>[].obs;
  var isloading = false.obs;

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  void fetchTodos() async {
    try {
      isloading(true);
      final result = await getTodoUsecase();
      todolist.assignAll(result);
    } finally {
      isloading(false);
    }
  }

  void addTodo(String title) async {
    try {
      isloading(true);
      await addTodoUseCase(title);
      fetchTodos();
    } catch (e) {
      Get.snackbar('Error', 'Todo not added');
    }
  }
  
  void deleteTodo(int id){
    todolist.removeWhere((todo) => todo.id == id);
  }
}
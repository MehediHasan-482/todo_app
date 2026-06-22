import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/routes/app_pages.dart';
import 'package:todo_app/features/daily_rotine/data/provider/todo_provider.dart';
import 'package:todo_app/features/daily_rotine/data/repository/todo_repository_impl.dart';
import 'package:todo_app/features/daily_rotine/domain/repository/todo_repository.dart';
import 'package:todo_app/features/daily_rotine/domain/usecase/add_todo_usecase.dart';
import 'package:todo_app/features/daily_rotine/domain/usecase/get_todo_usecase.dart';
import 'package:todo_app/features/daily_rotine/presentation/controllers/todo_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<TodoProvider>(TodoProvider());
    Get.lazyPut<TodoRepository>(
      () => TodoRepositoryImpl(provider: Get.find<TodoProvider>()),
    );
    Get.lazyPut<GetTodoUsecase>(
      () => GetTodoUsecase(repository: Get.find<TodoRepository>()),
    );
    Get.lazyPut<AddTodoUseCase>(
      () => AddTodoUseCase(repository: Get.find<TodoRepository>()),
    );
    Get.lazyPut<TodoController>(
      () => TodoController(
        getTodoUsecase: Get.find<GetTodoUsecase>(),
        addTodoUseCase: Get.find<AddTodoUseCase>(),
      ),
    );
    return GetMaterialApp(
      title: 'Plexus Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

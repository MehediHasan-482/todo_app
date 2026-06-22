import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/features/daily_rotine/presentation/controllers/todo_controller.dart';
import 'package:todo_app/features/daily_rotine/presentation/widgets/todo_tile.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PLEXUS TODO'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isloading.value && controller.todolist.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.todolist.isEmpty) {
          return const Center(child: Text('No todos found'));
        }
        return ListView.builder(
          itemCount: controller.todolist.length,
          itemBuilder: (context, index) {
            final todo = controller.todolist[index];
            return TodoTile(
              todo: todo,
              onDelete: () => controller.deleteTodo(todo.id),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context, controller),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context, TodoController controller) {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('New ToDo'),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: 'Enter your daily work'),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Delete')),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                controller.addTodo(textController.text);
              }
            },
            child: Text('ADD ToDo'),
          ),
        ],
      ),
    );
  }
}

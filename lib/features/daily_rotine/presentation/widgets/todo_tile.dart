import 'package:flutter/material.dart';
import 'package:todo_app/features/daily_rotine/domain/entities/todo_entity.dart';

class TodoTile extends StatelessWidget {
  final TodoEntity todo;
  final VoidCallback onDelete;

  const TodoTile({required this.todo, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          todo.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: todo.isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(
          todo.title,
          style: TextStyle(
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline, color: Colors.red),
          onPressed: onDelete,
        ),
        onTap: (){

        }
      ),
    );
  }
}
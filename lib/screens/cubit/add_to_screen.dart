import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/cubit/todo_cubit.dart';

class AddToPage extends StatelessWidget {
  const AddToPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: const .all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: .text,
              maxLines: 5,
              decoration: InputDecoration(label: Text('Todo')),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodoCubit>(
                  context,
                ).addTodo(controller.text.trim());
                Navigator.pop(context);
              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}

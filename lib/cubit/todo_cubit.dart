import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if(title.isEmpty) {
      addError('Title cannot be empty');
    }
    final todo = TodoModel(title: title, createdAt: DateTime.now());

    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);
    if (kDebugMode) {
      print('Todo Cubit- $change');
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if(kDebugMode) {
      print('Todo Cubit- $error');
    }
  }
}

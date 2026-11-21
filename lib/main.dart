import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';
import 'package:learning_bloc/bloc/page_one_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';
import 'package:learning_bloc/cubit_with_screens/page_one.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // create: (_) => CounterCubit(),
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: const PageOne(title: 'Flutter Demo Home Page'),
        home: const PageOneBloc(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

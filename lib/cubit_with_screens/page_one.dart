import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';
import 'package:learning_bloc/cubit_with_screens/inc_dec_page.dart';

class PageOne extends StatelessWidget {
  final String title;

  const PageOne({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final counter = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterCubit, int>(
              bloc: counter,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const IncDecPage()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

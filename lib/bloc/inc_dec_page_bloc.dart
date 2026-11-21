import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';

class IncDecPageBloc extends StatelessWidget {
  const IncDecPageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = BlocProvider.of<CounterBloc>(context);
    
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: .end,
        children: [
          FloatingActionButton(
            heroTag: 'button1',
            onPressed: () {
              counter.add(CounterIncrement());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            heroTag: 'button2',
            onPressed: () {
              counter.add(CounterDecrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/auth_bloc.dart';
import 'package:learning_bloc/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String uId;

  const HomeScreen({required this.uId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
            appBar: AppBar(title: Text('HomeScreen')),
            body: Padding(
              padding: .all(20),
              child: Text('UId: ${state.uId}'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthSignOut());
              },
              child: Icon(Icons.logout),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
      listener: (BuildContext context, AuthState state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
            (route) => false,
          );
        }
      },
    );
  }
}

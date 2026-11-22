import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/screens/home_screen.dart';
import 'package:learning_bloc/widgets/custom_text_field.dart';
import 'package:learning_bloc/widgets/sign_in_button.dart';

import '../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: .all(20),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error), showCloseIcon: true),
              );
            }
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (ctx) => HomeScreen(uId: state.uId)),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .end,
              children: [
                ///title
                Text('Sign in.', style: TextStyle(fontSize: 35)),
                SizedBox(height: 20),

                ///google btn
                SignInButton(
                  icon: Icons.g_mobiledata_sharp,
                  text: 'Continue with Google',
                  onClick: () {
                    context.read<AuthBloc>().add(AuthGoogleSignIn());
                  },
                ),
                SizedBox(height: 20),

                ///fb button
                SignInButton(
                  icon: Icons.facebook,
                  text: 'Continue with Facebook',
                  onClick: () {
                    context.read<AuthBloc>().add(AuthFacebookSignIn());
                  },
                ),

                /// or
                Padding(
                  padding: .symmetric(vertical: 10),
                  child: Text('or', style: TextStyle(fontSize: 18)),
                ),

                /// email & password text-field
                CustomTextField(label: 'Email', controller: emailController),
                const SizedBox(height: 15),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 40),

                /// sign in button
                SizedBox(
                  width: .infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: .circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent,
                          Colors.pink.shade300,
                          Colors.pink.shade200,
                        ],
                        begin: .topLeft,
                        end: .bottomRight,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthSignIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: .all(25),
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(12),
                        ),
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            );
          },
        ),
      ),
    );
  }
}

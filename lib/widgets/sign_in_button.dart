import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onClick;

  const SignInButton({
    required this.icon,
    required this.text,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: .all(22),
          shape: RoundedRectangleBorder(
            borderRadius: .circular(12),
          )
        ),
        onPressed: onClick,
        label: Text(text, style: TextStyle(
          fontSize: 16
        ),),
        icon: Icon(icon, size: 24,),
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInUpBottomText extends StatelessWidget {
  final String promptText; // Static text
  final String actionText; // Actionable text
  final TextStyle? promptStyle; // Style for static text
  final TextStyle? actionStyle; // Style for actionable text
  final VoidCallback onActionTap; // Callback for tap
  final MainAxisAlignment alignment; // Row alignment

  const SignInUpBottomText({
    super.key,
    this.promptText = "I don't have an Account? ", // Default prompt text
    this.actionText = "Sign Up", // Default action text
    this.promptStyle,
    this.actionStyle,
    required this.onActionTap, // Action tap is required
    this.alignment = MainAxisAlignment.center, // Default alignment
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        RichText(
          text: TextSpan(
            text: promptText,
            style: promptStyle ?? Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: actionText,
                style: actionStyle ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = onActionTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

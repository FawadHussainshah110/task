// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/utils/style.dart';

class CustomCheckBox extends StatefulWidget {
  final String text;
  final String? secondText;
  const CustomCheckBox({super.key, required this.text, this.secondText});
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          _rememberMe = !_rememberMe;
        });
      },
      child: Row(
        children: [
          SizedBox(
            width: 2.sp,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 18.sp,
            height: 18.sp,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
              shape: BoxShape.circle,
              color: _rememberMe ? Theme.of(context).primaryColor : Colors.transparent,
            ),
            child: _rememberMe
                ? const Icon(
                    Icons.check,
                    size: 11,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(
            width: 8.sp,
          ),
          RichText(
            text: TextSpan(
              text: widget.text,
              style: bodySmall(context).copyWith(fontWeight: FontWeight.w400),
              children: widget.secondText != null
                  ? [
                      TextSpan(
                        text: widget.secondText, // Second text
                        style: bodySmall(context)
                            .copyWith(fontWeight: FontWeight.w400, color: Theme.of(context).primaryColor),
                      ),
                    ]
                  : [],
            ),
          ),
        ],
      ),
    );
  }
}

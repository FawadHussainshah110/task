import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/utils/style.dart';

class ORWidget extends StatelessWidget {
  const ORWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 2,
          color: Theme.of(context).dividerColor,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.sp),
          child: Text(
            "or",
            style: bodyLarge(context).copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 2,
          color: Theme.of(context).dividerColor,
        )),
      ],
    );
  }
}

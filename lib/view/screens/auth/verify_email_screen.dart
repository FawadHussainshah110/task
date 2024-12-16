// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/custom_app_bar.dart';
import 'package:startup_repo/view/screens/auth/create_new_password.dart';
import 'package:startup_repo/view/screens/auth/widgets/pin_put_widget.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      launchScreen(const CreateNewPassword());
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.sp),
            child: const CustomAppBar(
              title: "Verify Your Email",
            )),
        body: SafeArea(
          child: Padding(
            padding: pagePadding,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Center(
                    child: Image.asset(
                      Images.logo,
                      width: double.infinity,
                      height: 380.sp,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Please enter the 4 digit code sent to ',
                      style: bodyLarge(context).copyWith(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: 'example@gmail.com',
                          style: bodyLarge(context).copyWith(
                            fontWeight: FontWeight.bold, // Bold for emphasis
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  CustomPinInput(
                    borderColor: Theme.of(context).hintColor,
                    borderRadius: 14,
                    borderWidth: 1.5,
                    boxHeight: 70.sp,
                    boxWidth: 70.sp,
                    filledColor: Colors.transparent,
                    unfilledColor: Colors.transparent,
                  ),
                  SizedBox(height: 40.sp),
                  PrimaryButton(
                    text: "Verify Code",
                    onPressed: _submitForm,
                  ),
                  SizedBox(height: 10.sp),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend Code?',
                      style: bodySmall(context).copyWith(
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

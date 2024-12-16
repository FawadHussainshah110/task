// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/base/custom_app_bar.dart';
import 'package:startup_repo/view/screens/auth/verify_email_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      launchScreen(const VerifyEmailScreen());
    } else {
      setState(() {
        // Triggers UI updates for validation errors
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.sp),
            child: const CustomAppBar(
              title: "Forgot Password",
            )),
        body: SafeArea(
          child: Padding(
            padding: pagePadding,
            child: Form(
              key: _formKey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.sp,
                  ),

                  Center(
                    child: Image.asset(
                      Images.logo,
                      width: double.infinity,
                      height: 380.sp,
                    ),
                  ),

                  SizedBox(height: 20.sp),

                  // Email TextField
                  CustomTextField(
                    showLabel: false,
                    labeImage: Images.logo,
                    hintText: "example@example.com",
                    labelText: "enter_email".tr,
                    // prefixIcon: Icons.mail,
                    controller: _emailController,
                    // validator: (value) => Validators.emailValidator(value),
                  ),
                  SizedBox(height: 35.sp),

                  PrimaryButton(
                    text: "Send Otp",
                    onPressed: _submitForm,
                  ),
                  SizedBox(height: 10.sp),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Try Another Way',
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

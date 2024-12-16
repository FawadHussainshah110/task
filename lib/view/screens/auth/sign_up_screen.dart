// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/images.dart';
import 'package:startup_repo/utils/style.dart';
import 'package:startup_repo/view/base/common/primary_button.dart';
import 'package:startup_repo/view/base/common/textfield.dart';
import 'package:startup_repo/view/screens/auth/sign_in_screen.dart';
import 'package:startup_repo/view/screens/auth/widgets/custom_check_box.dart';
import 'package:startup_repo/view/screens/auth/widgets/or_widget.dart';
import 'package:startup_repo/view/screens/auth/widgets/signIn_signup_bottom_text.dart';
import 'package:startup_repo/view/screens/auth/widgets/social_login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false; // Visibility state

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
    } else {
      setState(() {
        // Triggers UI updates for validation errors
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: pagePadding,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 25.sp,
                ),
                Center(
                  child: Image.asset(
                    Images.logo,
                    width: 180.sp,
                    height: 180.sp,
                  ),
                ),
                Center(
                  child: Text(
                    "register".tr,
                    style: headlineSmall(context),
                  ),
                ),

                SizedBox(height: 10.sp),
                CustomTextField(
                  showLabel: false,
                  labeImage: Images.logo,
                  hintText: "example@example.com",
                  labelText: "enter_name".tr,
                  // prefixIcon: Icons.mail,
                  controller: _emailController,
                  // validator: (value) => Validators.emailValidator(value),
                ),
                SizedBox(height: 10.sp),
                CustomTextField(
                  showLabel: false,
                  labeImage: Images.logo,
                  hintText: "example@example.com",
                  labelText: "enter_email".tr,
                  // prefixIcon: Icons.mail,
                  controller: _emailController,
                  // validator: (value) => Validators.emailValidator(value),
                ),
                SizedBox(height: 10.sp),
                // Email TextField

                CustomTextField(
                  showLabel: false,
                  labelText: "enter_password".tr,

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  obscureText: !_isPasswordVisible,
                  controller: _passwordController,
                  // validator: (value) => Validators.passwordValidator(value),
                ),
                SizedBox(height: 10.sp),

                CustomTextField(
                  showLabel: false,
                  labelText: "confirm_password".tr,

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  obscureText: !_isPasswordVisible,
                  controller: _passwordController,
                  // validator: (value) => Validators.passwordValidator(value),
                ),
                SizedBox(height: 15.sp),
                const CustomCheckBox(
                  text: 'Confrim All ',
                  secondText: 'Terms & Condition',
                ),
                SizedBox(height: 30.sp),
                // Sign In Button
                PrimaryButton(
                  text: "Sign Up",
                  onPressed: _submitForm,
                ),
                SizedBox(height: 15.sp),
                const ORWidget(),
                SizedBox(height: 30.sp),

                const SocialLoginWidget(),
                SizedBox(height: 10.sp),
                SignInUpBottomText(
                  promptText: "Already have account? ",
                  actionText: "Sign In",
                  onActionTap: () {
                    launchScreen(const SignInScreen(), replace: true);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

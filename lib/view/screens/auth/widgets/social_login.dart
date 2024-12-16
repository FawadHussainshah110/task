import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/view/base/common/network_image.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PrimaryNetworkImage(
            fit: BoxFit.contain,
            height: 35.sp,
            url:
                "https://banner2.cleanpng.com/20190228/qby/kisspng-google-logo-google-account-g-suite-google-images-g-icon-archives-search-png-1713904157115.webp"),
        SizedBox(
          width: 25.sp,
        ),
        PrimaryNetworkImage(
            fit: BoxFit.contain,
            height: 35.sp,
            url: "https://www.facebook.com/images/icons/FBLogo_Blueprint.png"),
      ],
    );
  }
}

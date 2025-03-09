import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/playground_feature/admin/presentation/widgets/login_screen/custom_text_form_feild.dart';

class CustomTextFormName extends StatelessWidget {
  CustomTextFormName({required this.emailController, super.key});

  TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 400.w,
      child: CustomTextFieldItem(
        fieldName: Constants.name,
        hintText: Constants.nameHint,
        controller: emailController,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return Constants.pleaseName;
          }
          return null;
        },
      ),
    );
  }
}

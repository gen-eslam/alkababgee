import 'package:alkababgee/core/constant/space_Manager.dart';
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/widgets/custom_text_form_field.dart';
import 'package:alkababgee/presentation/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            haveBorder: true,
            text: StringManager.emailAdress,
            prefixIcon: Icons.email,
            controller: LoginCubit.get(context).emailController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Enter your email";
              }
              return null;
            },
          ),
          AppSizedBox.h24,
          CustomTextFormFeild(
            haveBorder: true,
            text: StringManager.password,
            prefixIcon: Icons.password,
            controller: LoginCubit.get(context).passwordController,
            isPassword: true,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Enter your password";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

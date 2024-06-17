import 'package:alkababgee/core/constant/space_Manager.dart';
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/helper/enums.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_loading.dart';
import 'package:alkababgee/core/widgets/custom_snak_bar.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/core/widgets/custom_text_form_field.dart';
import 'package:alkababgee/presentation/auth/forget_and_reset/cubit/forget_password_cubit.dart';
import 'package:alkababgee/presentation/auth/widgets/logo_and_welcome_message.dart';
import 'package:alkababgee/presentation/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetpasswordCubit, ForgetpasswordState>(
      listener: (context, state) {
        if (state is ForgetpasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: state.message, colorState: ColorState.failure),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Form(
            key: ForgetpasswordCubit.get(context).formKey,
            child: Column(
              children: [
                const LogoAndWlcomeMessage(
                  tite: StringManager.alkababgee,
                ),
                AppSizedBox.h16,
                CustomText(
                  text: StringManager.forgetPassword,
                  color: ColorsManager.deepRed,
                  style: TextStyleManager.textStyle30w700,
                ),
                AppSizedBox.h16,
                CustomText(
                  text: StringManager.forgetPasswordMessage,
                  color: ColorsManager.deepRed,
                  style: TextStyleManager.textStyle20w400,
                ),
                AppSizedBox.h24,
                CustomTextFormFeild(
                  text: StringManager.emailAdress,
                  prefixIcon: Icons.email,
                  controller: ForgetpasswordCubit.get(context).emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your email";
                    }
                    return null;
                  },
                ),
                AppSizedBox.h24,
                BlocBuilder<ForgetpasswordCubit, ForgetpasswordState>(
                  builder: (context, state) {
                    if (state is ForgetpasswordLoading) {
                      return const CustomLoading();
                    } else {
                      return SubmitButtom(onPressed: () {
                        if (ForgetpasswordCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          ForgetpasswordCubit.get(context).sendResetLink();
                        }
                      });
                    }
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

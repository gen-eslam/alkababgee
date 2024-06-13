import 'package:alkababgee/core/constant/space_Manager.dart';
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_elevated_button.dart';
import 'package:alkababgee/core/widgets/custom_loading.dart';
import 'package:alkababgee/core/widgets/custom_outline_button.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/presentation/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () {
              context.pushNamed(Routes.forgetScreen);
            },
            child: CustomText(
              text: StringManager.forgetPassword,
              style: TextStyleManager.textStyle18w600,
              color: ColorsManager.deepRed,
            ),
          ),
        ),
        BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          return state is LoginLoading
              ? const CustomLoading()
              : CustomElevatedButton(
                  onPressed: () {
                    if (LoginCubit.get(context)
                        .formKey
                        .currentState!
                        .validate()) {
                      LoginCubit.get(context).login();
                    }
                  },
                  child: CustomText(
                    text: StringManager.loginMyAccount,
                    style: TextStyleManager.textStyle18w600,
                    color: ColorsManager.white,
                  ),
                );
        }),
        AppSizedBox.h24,
        CustomText(
          text: StringManager.or,
          style: TextStyleManager.textStyle24w500,
          color: ColorsManager.deepRed,
        ),
        AppSizedBox.h16,
        CustomOutlineButton(
          text: StringManager.signUp,
          onTap: () {
            context.pushNamed(Routes.signUpScreen);
          },
        ),
        AppSizedBox.h24,
      ],
    );
  }
}

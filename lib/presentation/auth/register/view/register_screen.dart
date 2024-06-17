import 'package:alkababgee/core/constant/space_Manager.dart';
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/helper/enums.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/theme/colors_manager.dart';
import 'package:alkababgee/core/theme/text_style_manager.dart';
import 'package:alkababgee/core/widgets/custom_elevated_button.dart';
import 'package:alkababgee/core/widgets/custom_snak_bar.dart';
import 'package:alkababgee/core/widgets/custom_text.dart';
import 'package:alkababgee/presentation/auth/register/logic/cubit/register_cubit.dart';
import 'package:alkababgee/presentation/auth/register/view/widgets/register_form.dart';
import 'package:alkababgee/presentation/auth/widgets/logo_and_welcome_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterSuccess) {
            await RegisterCubit.get(context)
                .addDataUserToFirebase()
                .then((value) {
              context.pushNamed(Routes.homeScreen);
            });
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                  text: state.message, colorState: ColorState.failure),
            );
          }
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
            width: context.deviceWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LogoAndWlcomeMessage(
                    tite: StringManager.welcomeRegister,
                  ),
                  AppSizedBox.h24,
                  const RegisterForm(),
                  AppSizedBox.h24,
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return state is RegisterLoading
                          ? const CircularProgressIndicator(
                              color: ColorsManager.yellow,
                            )
                          : CustomElevatedButton(
                              onPressed: () {
                                if (RegisterCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  RegisterCubit.get(context).register();
                                }
                              },
                              child: CustomText(
                                text: StringManager.createAccount,
                                color: ColorsManager.white,
                                style: TextStyleManager.textStyle15w700,
                              ),
                            );
                    },
                  ),
                  AppSizedBox.h24,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: RichText(
                      text: TextSpan(
                        text: StringManager.alreadyHaveAccount,
                        style: TextStyleManager.textStyle18w400.copyWith(
                          color: ColorsManager.deepRed,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                            text: StringManager.signIn,
                            style: TextStyleManager.textStyle18w400.copyWith(
                              color: ColorsManager.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

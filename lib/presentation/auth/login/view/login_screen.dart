import 'package:alkababgee/core/constant/space_Manager.dart';
import 'package:alkababgee/core/constant/string_manager.dart';
import 'package:alkababgee/core/helper/enums.dart';
import 'package:alkababgee/core/helper/extensions.dart';
import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/core/widgets/custom_snak_bar.dart';
import 'package:alkababgee/presentation/auth/login/logic/cubit/login_cubit.dart';
import 'package:alkababgee/presentation/auth/login/view/widgets/login_buttons.dart';
import 'package:alkababgee/presentation/auth/login/view/widgets/login_form.dart';
import 'package:alkababgee/presentation/auth/widgets/logo_and_welcome_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.pushNamed(Routes.homeScreen);
          } else if (state is LoginError) {
            customSnackBar(text: state.error, colorState: ColorState.failure);
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
                    tite: StringManager.alkababgee,
                  ),
                  AppSizedBox.h24,
                  const LoginForm(),
                  const LoginButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

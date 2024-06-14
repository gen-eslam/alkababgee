import 'package:alkababgee/core/routes/routes.dart';
import 'package:alkababgee/model/food/food_model.dart';
import 'package:alkababgee/presentation/auth/forget_and_reset/cubit/forget_password_cubit.dart';
import 'package:alkababgee/presentation/auth/forget_and_reset/view/forget_password_screen.dart';
import 'package:alkababgee/presentation/auth/login/logic/cubit/login_cubit.dart';
import 'package:alkababgee/presentation/auth/login/view/login_screen.dart';
import 'package:alkababgee/presentation/auth/register/logic/cubit/register_cubit.dart';
import 'package:alkababgee/presentation/auth/register/view/register_screen.dart';
import 'package:alkababgee/presentation/deliver_home/deliver_home_screen.dart';
import 'package:alkababgee/presentation/details/food_details_screen.dart';
import 'package:alkababgee/presentation/home/cubit/home_cubit.dart';
import 'package:alkababgee/presentation/home/view/home_screen.dart';
import 'package:alkababgee/presentation/payment/view/pages/payment_ui.dart';
import 'package:alkababgee/presentation/setting/setting_view.dart';
import 'package:alkababgee/presentation/splash/splash_screen.dart';
import 'package:alkababgee/presentation/tables/tables_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingScreen(),
      //   );

      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit()..getData(),
            child: const HomeScreen(),
          ),
        );
      case Routes.foodDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => FoodDetailsScreen(
            foodModel: arguments as FoodModel,
          ),
        );
      case Routes.deliverHomeScreen:
        return MaterialPageRoute(
          builder: (_) => DeliverHomeScreen(
            foodModel: arguments as FoodModel,
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ForgetpasswordCubit(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => PaymentPage(
            foodModel: arguments as FoodModel,
          ),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingView(),
        );
      case Routes.tablesViewScreen:
        return MaterialPageRoute(
          builder: (_) => const TablesView(),
        );
      // case Routes.addVehiclesScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const AddVehiclesScreen(),
      //   );
      // case Routes.ticketScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => TicketCubit()..getTicket(),
      //       child: const TicketPage(),
      //     ),
      //   );
      // case Routes.otpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OtpScreen(text: "romancawy12@gmail.com"),
      //   );
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignupCubit>(),
      //       child: const SignupScreen(),
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

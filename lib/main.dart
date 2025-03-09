// ignore_for_file: use_build_context_synchronously

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/class/custom_splash_screen.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/core/routing/routes.dart';
import 'package:kamn/custom_main_bloc_consumer.dart';
import 'package:kamn/init_dependencies.dart';
import 'core/common/cubit/firebase_remote_config/firebase_remote_config_cubit.dart';
import 'healthy_food_features/presentation/screens/searching_ui_screen.dart';

// void main() {
//   runApp(
//     ScreenUtilInit(
//       designSize: const Size(375, 812), // Adjust based on your design
//       minTextAdapt: true,  // Ensures proper text scaling
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: SearchingUiScreen(),
//         );
//       },
//     ),
//   );
// }


// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:kamn/core/di/di.dart';
import 'package:kamn/custom_main_bloc_consumer.dart';
import 'package:kamn/init_dependencies.dart';
import 'core/common/cubit/firebase_remote_config/firebase_remote_config_cubit.dart';

void main() async {
  await initDependencies();
  configureDependencies();
  // runApp(  DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // ),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppUserCubit>()..isFirstInstallation(),
        ),
        BlocProvider(
          create: (context) => FirebaseRemoteConfigCubit()
            ..initListner()
            ..getStringValue('test')
            ..getStringValue('app_version'),
        ),
      ],
      child: const ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: CustomMainBlocConsumer(),
      ),
    );
  }
}

// BlocListener<AppUserCubit, AppUserState>(
//             listener: (context, state) async {
//               await Future.delayed(const Duration(seconds: 2));

//               if (state.isLoggedIn()) {
//                 if (state.user?.type == 'normal') {
//                   Navigator.pushNamed(context, Routes.groundsScreen);
//                 } else {
//                   Navigator.pushNamed(context, Routes.serviceSelection);
//                 }
//               } else if (state.isNotLoggedIn()) {
//                 Navigator.pushNamed(context, Routes.onBoardingScreen);
//               }
//             },
//             child: const CustomSplashScreen(),
//           ),
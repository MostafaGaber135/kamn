import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kamn/core/helpers/bloc_observer.dart';
import 'package:kamn/firebase_options.dart';
import 'init_dependencies.dart';
import 'mvc/view/playgrounds_screen_mvc.dart';
import 'mvp/view/playground_screen_mvp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initDependencies();
  //configureDependencies();
  await ScreenUtil.ensureScreenSize();
  // Calling Bloc Observer
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        // initialRoute: Routes.serviceSelection,
        // onGenerateRoute: AppRouter.generateRoute,
        home: const PlaygroundsScreenMVP(),
      ),
    );
  }
}

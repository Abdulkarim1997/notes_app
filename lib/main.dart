import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/shard/styles/colors.dart';
import 'package:notes_app/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: myMaterialColor,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
                color: greyColor, fontSize: 13.sp, fontFamily: "myriad pro"),
            hintStyle: TextStyle(
                color: greyColor, fontSize: 13.sp, fontFamily: "myriad pro"),
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontFamily: "myriad pro",
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

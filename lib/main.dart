import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const Halloween());

class Halloween extends StatelessWidget {
  const Halloween({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: 'Halloween App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          backgroundColor: const Color(0xFF30294d),
          scaffoldBackgroundColor: const Color(0xFF30294d),
          primaryColor: const Color(0xFF1DE1CC),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1DE1CC),
            onBackground: Colors.white,
            onPrimary: Colors.white,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

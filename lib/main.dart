import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi/controllers/course_controller.dart';
import 'package:uyishi/controllers/note_controller.dart';
import 'package:uyishi/controllers/plan_controller.dart';
import 'package:uyishi/notifier/theme_notifier.dart';
import 'package:uyishi/services/auth_http_services.dart';
import 'package:uyishi/views/course_screen.dart';
import 'package:uyishi/views/home_screen.dart';
import 'package:uyishi/views/login_screen.dart';
import 'package:uyishi/views/note_screen.dart';
import 'package:uyishi/views/plans_screen.dart';
import 'package:uyishi/views/quiz_screen.dart';
import 'package:uyishi/views/settings_screen.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteController()),
        ChangeNotifierProvider(create: (_) => PlanController()),
        ChangeNotifierProvider(create: (_) => CourseController()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final authHttpServices = AuthHttpServices();
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    authHttpServices.checkAuth().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeNotifier.currentTheme,
      //
      //
      home: isLoggedIn ? HomeScreen() : LoginScreen(),
      //
      //
      routes: {
        '/notes': (context) => NoteScreen(),
        '/plans': (context) => PlansScreen(),
        '/courses': (context) => CourseScreen(),
        '/settings': (context) =>
            SettingsScreen(toggleTheme: themeNotifier.toggleTheme),
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentacion/screens/courses.dart';
import 'package:flutter_application_1/presentacion/screens/leccion.dart';
import 'package:flutter_application_1/presentacion/screens/todo.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_application_1/presentacion/screens/video_screen.dart';
//import 'package:flutter_application_1/presentacion/screens/course_screen.dart';
import 'package:flutter_application_1/presentacion/screens/leccion.dart';
import 'package:flutter_application_1/presentacion/screens/content_screen.dart';
import 'package:isar/isar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => VideoBackgroundScreen(),
      ),
      GoRoute(
        path: '/course',
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
      path: '/add-course',
      builder: (context, state) => AddAsignatura(),
      ),
      GoRoute(
        path:'/todo',
        builder: (contex, state) => TodoListScreen(),
      ),
      GoRoute(
      path: '/add-lesson/:courseId',
      builder: (context, state) {
        final courseId = int.parse(state.pathParameters['courseId']!);
        return AddLesson(courseId: courseId);
        },
      ),
      GoRoute(
        path: '/signature/:courseId',
        builder: (context, state) {
          final courseId = int.parse(state.pathParameters['courseId']!);
          return LessonScreen(courseId: courseId);
        },
      ),
      GoRoute(
        path: '/content/:courseId/:signatureId',
        builder: (context, state) {
          final courseId = int.parse(state.pathParameters['courseId']!);
          final signatureId = int.parse(state.pathParameters['signatureId']!);
          return ContentScreen(courseId: courseId, signatureId: signatureId);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

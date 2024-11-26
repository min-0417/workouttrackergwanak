import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:workouttrackergwanak/my_router.dart';
import 'package:workouttrackergwanak/workout_guide_page.dart';
import 'package:workouttrackergwanak/workout_home_page.dart';

import 'landing_page.dart';
import 'workout_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      // home: LandingPage(),
      // home: WorkoutListPage(),
      theme: FlexThemeData.light(scheme: FlexScheme.purpleM3),
      // home: WorkoutGuidePage(),
      // home: WorkoutHomePage(),
    );
  }
}

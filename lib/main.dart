import 'package:flutter/material.dart';
import 'package:workouttrackergwanak/workout_guide_page.dart';

import 'landing_page.dart';
import 'workout_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: LandingPage(),
      //home: WorkoutListPage(),
      // theme: FlexThemeData.light(scheme: FlexScheme.redWine),
      home: WorkoutGuidePage(),
    );
  }
}

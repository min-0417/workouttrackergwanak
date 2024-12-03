import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:workouttrackergwanak/workout.dart';
import 'workout_manager.dart';

class WorkoutGuidePage extends StatefulWidget {
  final int workoutsIndex;
  final int groupIndex;

  WorkoutGuidePage(
      {super.key, required this.workoutsIndex, required this.groupIndex});

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  // final List<Workout> workouts = WorkoutManager.workouts;
  late List<Workout> workouts;

  late int workoutsIndex;
  final player = AudioPlayer();
  late Workout currentWorkout;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutsIndex = widget.workoutsIndex;
    workouts = WorkoutManager.workoutGroups[widget.groupIndex].workouts;
    currentWorkout = workouts[workoutsIndex];
    WorkoutManager.increaseTodayWorkoutMinutes(currentWorkout.minutes);
    print('------${currentWorkout.kcal}');
    WorkoutManager.increaseTodayWorkoutCalories(currentWorkout.kcal);
  }

  IconButton getIconButton() {
    if (player.state == PlayerState.playing) {
      return IconButton(
        onPressed: () async {
          await player.stop();
          setState(() {});
        },
        icon: Icon(Icons.stop_circle),
        iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        color: Theme.of(context).colorScheme.primary,
      );
    } else {
      return IconButton(
        onPressed: () async {
          await player.play(AssetSource('${currentWorkout.audioName}'));
          setState(() {});
        },
        icon: Icon(Icons.play_circle_fill),
        iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
        color: Theme.of(context).colorScheme.primary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutGuide'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('${currentWorkout.name}',
              style: Theme.of(context).textTheme.displaySmall),
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  if (workoutsIndex == 0) {
                    workoutsIndex = workouts.length;
                  }
                  await player.stop();
                  setState(() {
                    workoutsIndex--;
                    currentWorkout = workouts[workoutsIndex];
                  });
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
              ),
              // Image(image:AssetImage('assets/squat.jpeg'),),
              Expanded(
                child: Image.asset('assets/${currentWorkout.imageName}'),
              ),
              IconButton(
                onPressed: () async {
                  if (workoutsIndex == workouts.length - 1) {
                    workoutsIndex = -1;
                  }
                  await player.stop();
                  setState(() {
                    workoutsIndex++;
                    currentWorkout = workouts[workoutsIndex];
                  });
                },
                icon: Icon(Icons.arrow_forward_ios),
                iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
              ),
            ],
          ),
          Text(
            '${currentWorkout.minutes}분',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          getIconButton(),
        ],
      ),
    );
  }
}

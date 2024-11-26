import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:workouttrackergwanak/workout.dart';

class WorkoutGuidePage extends StatefulWidget {
  final int workoutsIndex;
  WorkoutGuidePage({super.key, required this.workoutsIndex});

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  late int workoutIndex;
  final player = AudioPlayer();
  List<Workout> workouts = [
    Workout(
        name: '스쿼트',
        minutes: 30,
        imageName: 'squat.jpeg',
        audioName: 'squat.mp3',
        kcal: 200),
    Workout(
        name: '사이드런지',
        minutes: 20,
        imageName: 'side_lunge.jpeg',
        audioName: 'side_lunge.mp3',
        kcal: 100),
    Workout(
        name: '푸쉬업',
        minutes: 15,
        imageName: 'pushup.jpeg',
        audioName: 'pushup.mp3',
        kcal: 100),
    Workout(
        name: '마운틴클림버',
        minutes: 15,
        imageName: 'mountain_climber.jpeg',
        audioName: 'mountain_climber.mp3',
        kcal: 50),
    Workout(
        name: '런지',
        minutes: 20,
        imageName: 'lunge.jpeg',
        audioName: 'lunge.mp3',
        kcal: 100),
    Workout(
        name: '덤벨컬',
        minutes: 40,
        imageName: 'dumbell_curl.jpeg',
        audioName: 'dumbell_curl.mp3',
        kcal: 200),
    Workout(
        name: '덩키킥',
        minutes: 30,
        imageName: 'donkey_kick.jpeg',
        audioName: 'donkey_kick.mp3',
        kcal: 50),
    Workout(
        name: '친업',
        minutes: 25,
        imageName: 'chinup.jpeg',
        audioName: 'chinup.mp3',
        kcal: 300),
    Workout(
        name: '벤치프레스',
        minutes: 10,
        imageName: 'benchpress.jpeg',
        audioName: 'benchpress.mp3',
        kcal: 250),
  ];
  late Workout currentWorkout;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutIndex = widget.workoutsIndex;
    currentWorkout = workouts[workoutIndex];
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
                  if (workoutIndex == 0) {
                    workoutIndex = workouts.length;
                  }
                  await player.stop();
                  setState(() {
                    workoutIndex--;
                    currentWorkout = workouts[workoutIndex];
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
                  if (workoutIndex == workouts.length - 1) {
                    workoutIndex = -1;
                  }
                  await player.stop();
                  setState(() {
                    workoutIndex++;
                    currentWorkout = workouts[workoutIndex];
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

////////////
// class WorkoutGuidePage extends StatefulWidget {
//   WorkoutGuidePage({super.key});
//
//   @override
//   State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
// }
//
// class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
//   final player = AudioPlayer();
//
//   Row getIconButton() {
//     if (player.state == PlayerState.playing) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () async {
//               await player.pause();
//               setState(() {});
//             },
//             icon: Icon(Icons.pause_circle),
//             iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//           IconButton(
//             onPressed: () async {
//               await player.stop();
//               setState(() {});
//             },
//             icon: Icon(Icons.stop_circle),
//             iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ],
//       );
//     } else if (player.state == PlayerState.paused) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () async {
//               await player.resume();
//               setState(() {});
//             },
//             icon: Icon(Icons.play_circle_fill),
//             iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//           IconButton(
//             onPressed: () async {
//               await player.stop();
//               setState(() {});
//             },
//             icon: Icon(Icons.stop_circle),
//             iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ],
//       );
//     } else {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () async {
//               await player.play(AssetSource('squat.mp3'));
//               setState(() {});
//             },
//             icon: Icon(Icons.play_circle_fill),
//             iconSize: Theme.of(context).textTheme.displaySmall?.fontSize,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ],
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WorkoutGuide'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text('스쿼트', style: Theme.of(context).textTheme.displaySmall),
//           Row(
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.arrow_back_ios),
//                 iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
//               ),
//               // Image(image:AssetImage('assets/squat.jpeg'),),
//               Expanded(
//                 child: Image.asset('assets/squat.jpeg'),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.arrow_forward_ios),
//                 iconSize: Theme.of(context).textTheme.displayLarge?.fontSize,
//               ),
//             ],
//           ),
//           Text(
//             '30분',
//             style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           getIconButton(),
//         ],
//       ),
//     );
//   }
// }

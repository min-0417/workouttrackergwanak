import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouttrackergwanak/workout.dart';
import 'workout_manager.dart';

class WorkoutListPage extends StatelessWidget {
  final int groupIndex;
  WorkoutListPage({super.key, required this.groupIndex}) {
    WorkoutManager.currentWorkoutGroupIndex = groupIndex;
    WorkoutManager.increaseMonthlyWorkoutCount(); //호출될때마다 증가함
  }

  // final List<Workout> workouts = WorkoutManager.workouts;
  // 인스턴스 변수를 초기화 할 때는 함수 안에서만 초기화 할 수 있음.
  List<GestureDetector> getWorkoutList(BuildContext context) {
    List<Workout> workouts = WorkoutManager.workoutGroups[groupIndex].workouts;
    List<GestureDetector> workoutListRow = [];
    for (var i = 0; i < workouts.length; i++) {
      Workout workout = workouts[i];
      var name = workout.name;
      var image = workout.imageName;
      var minutes = workout.minutes;

      workoutListRow.add(
        GestureDetector(
          // workoutListRow 변수는 Row type만 저장. type을 GestureDetector로 변경 >> Widget과 같은 혈통이라 GestureDetector이 아닌 Widget으로 해도 괜찮.
          onTap: () {
            context
                .go('/workout_home/workout_list/$groupIndex/workout_guide/$i');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/$image')),
                ),
              ),
              Expanded(
                child: Text('${i + 1}.$name', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '$minutes 분',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return workoutListRow;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutList'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: getWorkoutList(context),
        ),
      ),
    );
  }
}

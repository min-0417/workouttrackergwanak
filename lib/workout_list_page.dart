import 'package:flutter/material.dart';
import 'package:workouttrackergwanak/workout.dart';

class WorkoutListPage extends StatelessWidget {
  WorkoutListPage({super.key});
  List<Workout> workouts = [
    Workout(
      name: '스쿼트',
      minutes: 30,
      imageName: 'squat.jpeg',
      audioName: 'squat.mp3',
      kcal: 200,
    ),
    Workout(
      name: '사이드런지',
      minutes: 20,
      imageName: 'side_lunge.jpeg',
      audioName: 'side_lunge.mp3',
      kcal: 100,
    ),
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

  List<Widget> getWorkoutList() {
    List<Widget> workoutListRow = [];
    for (var i = 0; i < workouts.length; i++) {
      Workout workout = workouts[i];
      var name = workout.name;
      var image = workout.imageName;
      var minutes = workout.minutes;

      workoutListRow.add(
        GestureDetector(
          // workoutListRow 변수는 Row type만 저장. type을 GestureDetector로 변경 >> Widget과 같은 혈통이라 GestureDetector이 아닌 Widget으로 해도 괜찮.
          onTap: () {
            print('click $i');
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
          children: getWorkoutList(),
        ),
      ),
    );
  }
}

// /*WorkoutListChallengePage*/
// class WorkoutListPage extends StatelessWidget {
//   WorkoutListPage({super.key});
//
//   List<String> workoutName = [
//     '스쿼트',
//     '사이드런지',
//     '푸쉬업',
//     '마운틴클림버',
//     '런지',
//     '덤벨컬',
//     '덩키킥',
//     '친업',
//     '벤치프레스',
//   ];
//   List<String> workoutImage = [
//     'squat.jpeg',
//     'side_lunge.jpeg',
//     'pushup.jpeg',
//     'mountain_climber.jpeg',
//     'lunge.jpeg',
//     'dumbell_curl.jpeg',
//     'donkey_kick.jpeg',
//     'chinup.jpeg',
//     'benchpress.jpeg',
//   ];
//   List<int> workoutMinutes = [
//     30,
//     20,
//     15,
//     15,
//     20,
//     40,
//     30,
//     25,
//     10,
//   ];
//
//   List<ListTile> getWorkoutList() {
//     List<ListTile> workoutListTiles = [];
//     for (var i = 0; i < workoutName.length; i++) {
//       var name = workoutName[i];
//       var image = workoutImage[i];
//       var minutes = workoutMinutes[i];
//       workoutListTiles.add(
//         ListTile(
//           contentPadding: EdgeInsets.all(20),
//           leading: Container(
//             width: 80,
//             height: 80,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(image: AssetImage('assets/$image')),
//             ),
//           ),
//           title: Text(
//             '${i + 1}.$name',
//             style: TextStyle(fontSize: 20),
//           ),
//           trailing: Text(
//             '$minutes 분',
//             style: TextStyle(fontSize: 20, color: Colors.blue),
//           ),
//         ),
//       );
//     }
//     return workoutListTiles;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WorkoutList'),
//       ),
//       body: ListView(
//         children: getWorkoutList(),
//       ),
//     );
//   }
// }

import 'package:workouttrackergwanak/workout_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'workout.dart';

class WorkoutManager {
  static final List<Workout> workouts = [
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

  static List<WorkoutGroup> workoutGroups = [
    WorkoutGroup(
      groupDescription: '아침을 여는 5가지 운동프로그램',
      workouts: [
        workouts[0],
        workouts[1],
        workouts[3],
        workouts[4],
        workouts[7],
      ],
    ),
    WorkoutGroup(
      groupDescription: '근력을 키우는 7가지 운동프로그램',
      workouts: [
        workouts[1],
        workouts[3],
        workouts[4],
        workouts[5],
        workouts[6],
        workouts[7],
        workouts[8],
      ],
    ), //그룹2
  ];

  static int? currentWorkoutGroupIndex;

  static Future<void> increaseMonthlyWorkoutCount() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    int monthlyCount = await getMonthlyWorkoutCount();
    asyncPrefs.setInt('monthlyCount', ++monthlyCount);
  } // 저장하는애

  static Future<int> getMonthlyWorkoutCount() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int monthlyCount = await asyncPrefs.getInt('monthlyCount') ?? 0;
    return monthlyCount;
  } // 읽어오는애

  static void increaseTodayWorkoutMinutes(int minutes) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int todayMinutes = await getTodayWorkoutMinutes();
    await asyncPrefs.setInt('todayMinutes', todayMinutes + minutes);
  }

  static Future<int> getTodayWorkoutMinutes() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int todayMinutes = await asyncPrefs.getInt('todayMinutes') ?? 0;
    return todayMinutes;
  }

  static void increaseTodayWorkoutCalories(int Kcal) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int todayCalories = await getTodayWorkoutCalories();
    await asyncPrefs.setInt('todayCalories', todayCalories + Kcal);
  }

  static Future<int> getTodayWorkoutCalories() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    int todayCalories = await asyncPrefs.getInt('todayCalories') ?? 0;
    return todayCalories;
  }
}

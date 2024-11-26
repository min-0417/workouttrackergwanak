import 'package:go_router/go_router.dart';
import 'package:workouttrackergwanak/landing_page.dart';
import 'package:workouttrackergwanak/workout_guide_page.dart';
import 'package:workouttrackergwanak/workout_home_page.dart';
import 'package:workouttrackergwanak/workout_list_page.dart';

// GoRouter configuration
// 라우터는 글로벌 변수로 만들어도 괜찮음. >> _ 지움..
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
      routes: [
        GoRoute(
          path: 'workout_home',
          builder: (context, state) {
            return WorkoutHomePage();
          },
          routes: [
            GoRoute(
              path: 'workout_list',
              builder: (context, state) {
                return WorkoutListPage();
              },
              routes: [
                GoRoute(
                  path: 'workout_guide/:workouts_index',
                  builder: (context, state) {
                    String? workoutsIndexString =
                        state.pathParameters['workouts_index'];
                    final workoutsIndex = int.parse(workoutsIndexString!);
                    return WorkoutGuidePage(workoutsIndex: workoutsIndex);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

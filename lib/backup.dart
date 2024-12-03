// GoRoute(
// path: 'workout_home',
// builder: (context, state) {
// return WorkoutHomePage();
// },
// routes: [
// GoRoute(
// path: 'workout_list/:group_index',
// builder: (context, state) {
// String? groupIndexString = state.pathParameters['group_index'];
// final groupIndex = int.parse(groupIndexString!);
// return WorkoutListPage(groupIndex: groupIndex);
// },
// routes: [
// GoRoute(
// path: 'workout_guide/:workouts_index',
// builder: (context, state) {
// String? workoutsIndexString =
// state.pathParameters['workouts_index'];
// final workoutsIndex = int.parse(workoutsIndexString!);
//
// return WorkoutGuidePage(
// workoutsIndex: workoutsIndex, groupIndex: groupIndex);
// },
// ),
// ],
// ),
// ],
// ),

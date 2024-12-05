//
// class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget> {
//   TextStyle _textStyle = TextStyle(fontSize: 24, color: Colors.black);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedDefaultTextStyle(
//           style: _textStyle,
//           duration: Duration(seconds: 2),
//           child: Text('Hello, World!'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _textStyle =
//                 _textStyle == TextStyle(fontSize: 24, color: Colors.black)
//                     ? TextStyle(fontSize: 48, color: Colors.blue)
//                     : TextStyle(fontSize: 24, color: Colors.black);
//           });
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }

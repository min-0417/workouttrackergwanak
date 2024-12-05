import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget>
    with SingleTickerProviderStateMixin {
  Alignment _alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedAlign(
          alignment: _alignment,
          duration: Duration(seconds: 2),
          child: FlutterLogo(size: 115),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _alignment = _alignment == Alignment.topLeft
                ? Alignment.bottomRight
                : Alignment(0.0, 1.0);
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

// class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget>
//     with SingleTickerProviderStateMixin {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }
//

// class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget>
//     with SingleTickerProviderStateMixin {
//   double _width = 115;
//   double _height = 115;
//   Color _color = Colors.blue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedContainer(
//           width: _width,
//           height: _height,
//           color: _color,
//           duration: Duration(seconds: 2),
//           child: FlutterLogo(size: 115),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _width = _width == 115 ? 215 : 115;
//             _height = _height == 115 ? 215 : 115;
//             _color = _color == Colors.blue ? Colors.red : Colors.blue;
//             215;
//           });
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }

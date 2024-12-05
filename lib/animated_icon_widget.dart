import 'package:flutter/cupertino.dart';

// 홈페이지에 있는 아이콘에 애니메이션을 주기 위한 파일
class AnimatedIconWidget extends StatefulWidget {
  final IconData icon;
  final double? size;
  final Color color;
  AnimatedIconWidget({
    super.key,
    required this.icon,
    required this.size,
    required this.color,
  });

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  // 상속하기 위해서 티커(ticker) 추가?
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    final Animation<double> _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutSine,
    );
    _animation = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 40.0), weight: 1), // weight은 가중치
      TweenSequenceItem(tween: Tween(begin: 40.0, end: -20.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -2.0, end: 7.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 7.0, end: -3.5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3.5, end: 1.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
    ]).animate(_curvedAnimation);

    _animation.addListener(() {
      if (_animation.status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (_animation.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
      // setState(() {}); // 1초에 60번 호출되는 중 >> 셋스테이드 대신 애니메이티드빌더를 보통 사용함
    }); // 이닛스테이트 다음에 빌드가 수행됨. > 셋스테이트 하기 전에 빌드가 되었는가를 확인하는 것이 좋은 코드임.

    // _controller.forward(); // 아이콘버튼이 흔들리도록 해줌.
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  } // 이왕이면 dispose( 메모리를 해지하는 용도 ) 쓰는게 좋음

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value * 0.0174533,
            child: Icon(
              widget.icon,
              size: widget.size,
              color: widget.color,
            ),
          );
        }); // 애니메이션 커스텀 위젯을 만든것. 대시보드 카드 아이콘 대신 여기 아이콘 쓰게 해야함
  }
}

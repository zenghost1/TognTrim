import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../theme.dart';
import 'landingdisplay.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late DecorationImage background;
  late final _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    background = DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.43), BlendMode.srcOver),
        image: const AssetImage("assets/images/togandtrimlanding.jpeg"),
        fit: BoxFit.cover);

    Timer(
      const Duration(milliseconds: 2000),
      () => Navigator.of(context).pushReplacement(_createRoute(LandingDisplay(
        backgroundimg: background,
      ))),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    precacheImage(background.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
        height: MediaQuery.of(context).size.height,
        color: landingpagebackgroundcolor,
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Image.network(
                "https://togandtrim.com/wp-content/uploads/2022/06/Tog-Trim_final.jpg"),
          ),
        ));
  }
}

//function that returns next page with animation
Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      timeDilation = 1.7;
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

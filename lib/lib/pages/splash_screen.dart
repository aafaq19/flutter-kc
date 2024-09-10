import 'package:flutter/material.dart';

// ignore: camel_case_types
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 182, 206, 226),
                Color.fromARGB(255, 215, 212, 216)
              ],
            ),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  width: 250 * _animation.value,
                  height: 250 * _animation.value,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/playstore.png'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

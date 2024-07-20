import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with a duration of 4 seconds
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    // Define the Tween to interpolate between 200 and 0
    animation = Tween(begin: 200.0, end: 0.0).animate(animationController)
      ..addListener(() {
        setState(() {
          // Update the UI with the new animation values
        });
      });

    // Start the animation
    animationController.forward();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed from the widget tree
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TWEEN ANIMATION'),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.blue, // Adding color to visualize the animation
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

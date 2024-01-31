import 'package:flutter/material.dart';
import 'package:my_project/clothList.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ClothesListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green[50],
        child: Center(
          child: Text("Laboratory 2",
              style: TextStyle(
                  color: Colors.lightGreenAccent[700],
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontFamily: "Arial")),
        ));
  }
}

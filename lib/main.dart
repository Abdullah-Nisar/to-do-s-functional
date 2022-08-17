import 'package:flutter/material.dart';
import 'package:to_dos_functional/views/plan_screen.dart';

void main() {
  runApp(MasterPlanApp());
}

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlanScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}


// git remote add origin https://github.com/Abdullah-Nisar/to-do-s-functional.git
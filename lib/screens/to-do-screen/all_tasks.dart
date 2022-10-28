import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/patterns/singleton/singleton.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  final SingletonAllTasks singleton = const SingletonAllTasks();
  @override
  Widget build(BuildContext context) {
    
    
    ///////////////////Singleton Pattern///////////////////
    return singleton;
    ///////////////////////////////////////////////////////
  }
}

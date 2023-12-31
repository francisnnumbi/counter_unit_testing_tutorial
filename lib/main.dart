import 'package:counter_unit_testing_tutorial/counter.dart';
import 'package:counter_unit_testing_tutorial/user/users_list.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Counter Unit Test Tuto'),
      home: UsersList(),
    );
  }
}

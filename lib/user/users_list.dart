import 'package:counter_unit_testing_tutorial/user/user_model.dart';
import 'package:counter_unit_testing_tutorial/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UsersList extends StatefulWidget{
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  UserRepository userRepository = UserRepository(Client());

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: const Text('Users List'),
      centerTitle: true,
    ),
    body:  FutureBuilder(
      future: userRepository.getUser(),
      builder:(_, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if(snapshot.connectionState == ConnectionState.none) {
          return const Center(child: Text("No connection !"));
        }
        return ListTile(
          title: Text(snapshot.data!.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(snapshot.data!.email),
              Text(snapshot.data!.username),
            ],
          ),

        );
      }
    ),
  );
  }
}
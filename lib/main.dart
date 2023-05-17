import 'package:firebasedemo/firestore_manager.dart';
import 'package:firebasedemo/user_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> example() async {
    FirestoreManager manager = FirestoreManager.instance;

    // Tüm kullanıcıları almak için:
    List<User> users = await manager.getAllUsers();
    for (var user in users) {
      print('User ID: ${user.id}');
      print('Name: ${user.name}');
      print('Email: ${user.email}');
    }

    // Belirli bir kullanıcıyı almak için:
    String userId = 'user_id';
    User user = await manager.getUserById(userId);
    if (user != null) {
      print('User ID: ${user.id}');
      print('Name: ${user.name}');
      print('Email: ${user.email}');
    }

    // Yeni bir kullanıcı eklemek için:
    User newUser =
        User(id: 'new_user_id', name: 'John Doe', email: 'john@example.com');
    await manager.addUser(newUser);
    print('Yeni kullanıcı eklendi.');

    // Bir kullanıcıyı güncellemek için:
    String userIdToUpdate = 'user_id_to_update';
    User existingUser = await manager.getUserById(userIdToUpdate);
    existingUser.name = 'Jane Smith';
    existingUser.email = 'jane@example.com';
    await manager.updateUser(existingUser);
    print('Kullanıcı güncellendi.');

    // Bir kullanıcıyı silmek için:
    String userIdToDelete = 'user_id_to_delete';
    await manager.deleteUser(userIdToDelete);
    print('Kullanıcı silindi.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            example();
          },
          child: const Text('Firestore Demo'),
        ),
      ),
    );
  }
}

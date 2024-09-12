import 'package:frontend_template/home/widgets/account_drawer/account_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/nav_bar/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 12, 12, 12),
              Color.fromARGB(255, 15, 15, 15),
              Color.fromARGB(255, 25, 25, 25),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NavBar(),
          ],
        ),
      ),
      /* drawer: const HierarchyDrawer(), */
      endDrawer: AccountDrawer(),
    );
  }
}

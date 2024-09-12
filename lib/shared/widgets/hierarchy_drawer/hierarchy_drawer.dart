import 'package:flutter/material.dart';
import './hierarchy_tree_view/hierarchy_tree_view.dart';

class HierarchyDrawer extends StatefulWidget {
  const HierarchyDrawer({super.key});

  @override
  State<HierarchyDrawer> createState() => _HierarchyDrawerState();
}

class _HierarchyDrawerState extends State<HierarchyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 7, 57, 107),
              height: 110,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/header_orbitas_fondo_2.png',
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 4,
              color: Color.fromARGB(255, 54, 110, 155),
            ),
            const Expanded(
              child: HierarchyTreeView(),
            ),
            const Divider(
              height: 1,
              thickness: 4,
              color: Color.fromARGB(255, 54, 110, 155),
            ),
            Container(
              color: const Color.fromARGB(255, 7, 57, 107),
              height: 150,
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.graphic_eq_rounded,
                        color: Colors.white,
                      ),
                      iconSize: 82,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      iconSize: 82,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      iconSize: 82,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

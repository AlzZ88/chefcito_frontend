import 'package:flutter/material.dart';

class HierarchyNode extends StatelessWidget {
  const HierarchyNode(
      {super.key,
      required this.state,
      required this.name,
      required this.level});
  final String state;
  final String name;
  final int level;
  @override
  Widget build(BuildContext context) {
    Color state_color = Colors.red;
    switch (state) {
      case "verde":
        state_color = Colors.green;
        break;
      case "amarillo":
        state_color = Colors.yellow;
        break;
      case "naranja":
        state_color = Colors.orange;
        break;
      case "rojo":
        state_color = Colors.red;
        break;
    }
    return Row(
      children: [
        level == 2
            ? Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: state_color,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            : Container(),
        Text(name,
            style: TextStyle(
              color: Colors.white,
              fontSize: level == 0 ? 20 : (level == 1 ? 20 : 16),
              fontFamily: 'Readex Pro',
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}

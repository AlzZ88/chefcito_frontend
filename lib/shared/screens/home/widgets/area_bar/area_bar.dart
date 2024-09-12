import 'package:flutter/material.dart';

class AreaBar extends StatelessWidget {
  const AreaBar({super.key, required this.area});
  final String area;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.factory_sharp, color: Colors.blue,),
        Text(area,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Readex Pro',
            fontSize: 24,
            color:Colors.blue,
            ),
        ),
        const Icon(Icons.help_outline, color: Colors.blue,),
      ],
    );
  }
}
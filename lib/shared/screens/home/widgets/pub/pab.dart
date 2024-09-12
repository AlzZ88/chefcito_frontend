import 'package:flutter/material.dart';

import 'pab_button.dart';

class Pab extends StatefulWidget {
  const Pab({super.key});

  @override
  State<Pab> createState() => _PabState();
}

class _PabState extends State<Pab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.sizeOf(context).width * 0.25,
      child: Card(
        elevation: 1,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PabButton(
              name: "Inicio",
              onTap: () {},
              selected: true,
              width: (MediaQuery.sizeOf(context).width * 0.25) * 0.32,
            ),
            PabButton(
                name: "Orbitas",
                onTap: () {},
                selected: false,
                width: (MediaQuery.sizeOf(context).width * 0.25) * 0.32),
            PabButton(
                name: "Tendencias",
                onTap: () {},
                selected: false,
                width: (MediaQuery.sizeOf(context).width * 0.25) * 0.32),
          ],
        ),
      ),
    );
  }
}

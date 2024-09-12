import 'package:flutter/material.dart';

class CurrentAppBanner extends StatelessWidget {
  const CurrentAppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: 5.0,
          ),
          child: Text(
            'Estas en',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 12, 57, 116),
                Color.fromARGB(255, 68, 57, 225),
              ],
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 180,
                child: Image.asset(
                  'assets/images/header_orbitas_fondo_2.png',
                ),
              ),
              Column(
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(
                      Icons.help_outline,
                      size: 18,
                    ),
                    label: const Text('Ayuda'),
                    onPressed: () => {},
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

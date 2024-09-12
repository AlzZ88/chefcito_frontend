import 'package:flutter/material.dart';

import '../app_card/app_card.dart';

class AppGrid extends StatefulWidget {
  const AppGrid({super.key});

  @override
  State<AppGrid> createState() => _AppGridState();
}

class _AppGridState extends State<AppGrid> {
  final List<String> tcmsLogosPath = [
    "assets/images/icon_LogBook.png",
    "assets/images/icon_AIDetector.png",
    "assets/images/icon_Sentinel.png",
    "assets/images/icon_RCMTool.png",
  ];
  int selectedAppIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 5.0),
          child: Text(
            'Más apps de TCMS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 350,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(tcmsLogosPath.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAppIndex = index;
                  });
                },
                child: AppCard(
                  imgPath: tcmsLogosPath[index],
                  isSelected: selectedAppIndex == index,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

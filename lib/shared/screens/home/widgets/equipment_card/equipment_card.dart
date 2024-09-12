import 'package:flutter/material.dart';
class EquipmentCard extends StatelessWidget {
  const EquipmentCard({super.key, required this.equipment});
  final String equipment;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: Card(
        color:Colors.white,
        elevation: 1,
        child: InkWell(
          splashColor: Colors.white,
          onTap: (){
            
          },
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(equipment,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Readex Pro',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const Icon(Icons.check,color: Colors.green,)
            ],),
            Container(color: Colors.red,width: 180,height:60,)
          ],)
        ),
      ),
    );
  }
}
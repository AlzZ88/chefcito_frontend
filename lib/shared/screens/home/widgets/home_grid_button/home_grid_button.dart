import 'package:flutter/material.dart';

class HomeGridButton extends StatefulWidget {
  const HomeGridButton({super.key, required this.name, required this.onTap});
  final String name;
  final Function onTap;
  @override
  State<HomeGridButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeGridButton> {
  bool hover = false;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        splashColor: Colors.purple,
        onTap: (){
          widget.onTap();
        },
        onHover: (value) {
          setState(() {
            hover = value;
          });
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: !hover?const Color.fromARGB(255, 117, 26, 133):Colors.purple,),
          width: (MediaQuery.sizeOf(context).width-200) / 4,
          height: (MediaQuery.sizeOf(context).height-200) / 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.comment,color: !hover?Colors.white:Colors.grey),
              Text(widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Readex Pro',
                  fontSize: 24,
                  color: !hover?Colors.white:Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
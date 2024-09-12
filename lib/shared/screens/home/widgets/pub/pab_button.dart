import 'package:flutter/material.dart';

class PabButton extends StatefulWidget {
  const PabButton(
      {super.key,
      required this.selected,
      required this.name,
      required this.onTap,
      required this.width});
  final Function onTap;
  final String name;
  final bool selected;
  final double width;
  @override
  State<PabButton> createState() => _PabButtonState();
}

class _PabButtonState extends State<PabButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 60,
      child: Card(
        color: !widget.selected
            ? Colors.white
            : const Color.fromARGB(255, 240, 240, 240),
        elevation: 1,
        child: InkWell(
          splashColor: widget.selected
              ? Colors.white
              : const Color.fromARGB(255, 220, 220, 220),
          onTap: () {
            if (!widget.selected) {
              widget.onTap;
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontWeight:
                      widget.selected ? FontWeight.normal : FontWeight.bold,
                  fontFamily: 'Readex Pro',
                  fontSize: 14,
                  color: widget.selected ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

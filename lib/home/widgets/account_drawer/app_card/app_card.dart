import 'package:flutter/material.dart';

class AppCard extends StatefulWidget {
  const AppCard({super.key, required this.imgPath, required this.isSelected});
  final String imgPath;
  final bool isSelected;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: SizedBox(
        width: 20,
        height: 20,
        child: Card(
          elevation: 0.0,
          color: _isHovered ? Colors.lightBlue[200] : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Opacity(
            opacity: widget.isSelected ? 1.0 : 0.5,
            child: Image.asset(widget.imgPath),
          ),
        ),
      ),
    );
  }
}
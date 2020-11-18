import 'package:flutter/material.dart';
import './main.dart';

class GenderWidget extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color normalColor;
  final Function changeColor;
  GenderWidget({this.name, this.icon, this.normalColor, this.changeColor});

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String name = widget.name;
        widget.changeColor(name);
      },
      onDoubleTap: () {},
      child: ReusableCard(
        cardData: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 80,
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        color: widget.normalColor,
      ),
    );
  }
}

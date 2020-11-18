import 'package:flutter/material.dart';
import './main.dart';

class BottomReusableCard extends StatelessWidget {
  final String name;
  final int data;
  final Function addData;
  final Function minusData;

  BottomReusableCard({this.name, this.data, this.addData, this.minusData});
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: normalColor,
      cardData: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name : $data',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                onPressed: () {
                  addData(name, data);
                },
                child: Icon(
                  Icons.add,
                  size: 50,
                ),
              ),
              FlatButton(
                onPressed: () {
                  minusData(name, data);
                },
                child: Icon(
                  Icons.remove,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:covid_19/main.dart';
import 'package:covid_19/constant.dart';
import 'package:flutter/material.dart';

class Contain1 extends StatelessWidget {
  final String value;
  final String title;
  Color color;

  Contain1({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: kInfectedColor, width: 2))),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kInfectedColor.withOpacity(0.26),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 20, color: color),
          ),
          Text(
            "$value",
            style: kSubTextStyle,
          ),
        ],
      ),
    );
  }
}
import 'package:covid_19/main.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constant.dart';
import 'homeScreenHeader.dart';
import 'package:flutter_svg/flutter_svg.dart';
List<String> items1 = ['India', 'Kasganj', 'Noida'];
String itemSelected = "India";

class StatefullBuilder1 {

  static StatefulBuilder buildStatefulBuilder() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                      value: itemSelected,
                      onChanged: (String newValueSelected) {
                        setState(() {
                          itemSelected = newValueSelected;
                        });
                      },
                      items: items1.map((String dropdownitem) {
                        return DropdownMenuItem<String>(
                          value: dropdownitem,
                          child: Text(dropdownitem),
                        );
                      }).toList(),
                    ))
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xffE5E5E5))),
          );
        });
  }
}
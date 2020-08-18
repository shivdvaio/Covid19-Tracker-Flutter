import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19/constant.dart';
import 'package:covid_19/Widgets/counter.dart';
import 'package:covid_19/Widgets/homeScreenHeader.dart';
import 'package:covid_19/Widgets/buildStatefulBuilder.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          homeScreenHeader(
            titleTop: "Get To Know",
            titleBottom: 'About Covid',
            imageSrc: 'assets/icons/coronadr.svg',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Symptoms",
                  style: kTitleTextstyle,
                ),
                Row(
                  children: [
                    ContainerOfRow(
                      ImgSrc: "assets/images/headache.png",
                      text: "Headche",
                    ),
                    ContainerOfRow(
                      ImgSrc: "assets/images/caugh.png",
                      text: "Cough",
                    ),
                    ContainerOfRow(
                      ImgSrc: "assets/images/fever.png",
                      text: "Fever",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Prevention",
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 156,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        child: Image.asset('assets/images/wear_mask.png',),
                        height: 136,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 40,
                                  color: kShadowColor)
                            ]),
                      ),
                      Positioned(
                        left: 136,
                        child: Container(height: 136,
                        child: Column(children: [
                          Text('Wear Face Mask',style: kTitleTextstyle.copyWith(fontSize: 16),)
                        ],),
                      ),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContainerOfRow extends StatelessWidget {
  final String ImgSrc;
  final String text;

  ContainerOfRow({this.text, this.ImgSrc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                '$ImgSrc',
                height: 60,
              ),
              Text(
                '$text',
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 30,
                  color: kActiveShadowColor)
            ]),
      ),
    );
  }
}

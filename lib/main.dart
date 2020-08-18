import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constant.dart';
import 'package:covid_19/Widgets/counter.dart';
import 'Widgets/homeScreenHeader.dart';
import 'package:covid_19/Widgets/buildStatefulBuilder.dart';
import 'package:covid_19/Screen/infoScreen1.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            homeScreenHeader(titleTop: 'दो गज की दूरी, बहुत ',titleBottom: 'बहुत जरूर',imageSrc: 'assets/icons/Drcorona.svg',),
          StatefullBuilder1.buildStatefulBuilder(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Case Update\n', style: kTitleTextstyle),
                          TextSpan(
                              text: 'Latest Update August 18 2020',
                              style: TextStyle(color: kTextLightColor))
                        ]),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>InfoScreen()));
                        },
                        child: Text(
                          "See Details",
                          style: TextStyle(
                              color: kPrimaryColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Contain1(
                    title: "Infected",
                    value: "2.65M",
                    color: kInfectedColor,
                  ),
                  Contain1(
                    title: "Death",
                    value: "50,921",
                    color: kDeathColor,
                  ),
                  Contain1(
                    title: "Recovered",
                    value: "1.92M",
                    color: kRecovercolor,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: kShadowColor)
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spread Of Virus",
                      style: kTitleTextstyle,
                    ),
                    Text(
                      "See Details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/images/map.png',fit: BoxFit.contain,),
              height: 178,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10), blurRadius: 30, color: kShadowColor)
              ]),
            ),

          ],
        ),
      ),
    );
  }


}


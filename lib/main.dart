import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constant.dart';

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
  List<String> items1 = ['India', 'Kasganj', 'Noida'];
  String itemSelected = "India";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset('assets/icons/menu.svg')),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Drcorona.svg',
                            width: 200,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          Positioned(
                            top: 20,
                            left: 150,
                            child: Text(
                              "दो गज की दूरी, बहुत \nजरूरी !",
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.black),
                            ),
                          ),
                          Container()
                        ],
                      ),
                    )
                  ],
                ),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/virus.png')),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [Colors.orange, Colors.white, Colors.green])),
              ),
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return

                  Container(
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
                              setState((){
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
              }
            ),
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
                      Text(
                        "See Details",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      )
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
                  Contain1(title: "Infected",
                      value: "2.65M",
                    color: kInfectedColor,
                  ),
                  Contain1(title: "Death",
                    value: "50,921",
                    color: kDeathColor,
                  ),
                  Contain1(title: "Recovered",
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
                  Text("Spread Of Virus",style: kTitleTextstyle,)
                     ,Text("See Details",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600),)
            ],),
               ),
             )
          ],
        ),
      ),
    );
  }
}

class Contain1 extends StatelessWidget {
 final String value;
 final String title;
 Color color;
 Contain1({this.title,this.value,this.color});

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
                    border: Border.all(
                        color: kInfectedColor, width: 2))),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kInfectedColor.withOpacity(0.26),
            ),
          ),
          SizedBox(height: 10,),
          Text("$title",style: TextStyle(fontSize: 20,color: color),),
          Text("$value",style: kSubTextStyle,)
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 10);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    //
    return false;
  }
}

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
      body: Column(
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
                            style:
                                kHeadingTextStyle.copyWith(color: Colors.black),
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
                    StatefulBuilder(
                        builder:
                            (BuildContext context, StateSetter setState) {});
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
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
               Row(children: [
                 RichText(
                   text: TextSpan(children: [
                     TextSpan(text: 'Case Update\n', style: kTitleTextstyle),
                     TextSpan(text: 'Latest Update March 28',style:  TextStyle(color: kTextLightColor))
                   ]),
                 ),
                 Spacer(),
                 Text("See Details",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w600),)
               ],)
              ],
            ),
          ),
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

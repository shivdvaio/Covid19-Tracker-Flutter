import 'package:flutter/material.dart';
import 'package:covid_19/main.dart';
import 'package:covid_19/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homeScreenHeader extends StatelessWidget {
final String imageSrc;
final String titleTop;
final String titleBottom;
homeScreenHeader({this.imageSrc,this.titleTop,this.titleBottom});
@override
Widget build(BuildContext context) {
  return ClipPath(
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
                  '$imageSrc',
                  width: 200,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
                Positioned(
                  top: 20,
                  left: 150,
                  child: Text(
                    "$titleTop \n  $titleBottom",
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

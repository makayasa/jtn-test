import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

TextStyle get kDefaultTextStyle {
  // return GoogleFonts.poppins(
  //   color: kBgBlack,
  //   fontStyle: FontStyle.normal,
  //   fontWeight: FontWeight.normal,
  // );
  return GoogleFonts.roboto(
    color: kBgBlack,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
}

const kDefaultCurve = Curves.easeInOutCirc;
const kDefaultFastDuration = Duration(milliseconds: 250);
const kDefaultDuration = Duration(milliseconds: 500);

const kDefaultScaffoldPadding = EdgeInsets.symmetric(horizontal: 10);

const kDefaultBorderRadius10 = BorderRadius.all(
  Radius.circular(10),
);
const kDefaultBorderRadius15 = BorderRadius.all(
  Radius.circular(15),
);
const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(5),
);

var a = GoogleFonts.playfairDisplay;

// var a = GoogleFonts.getFont(
//   data.value.fontFamily!,
//   textStyle: TextStyle(
//     fontSize: data.value.fontSize,
//     fontWeight: data.value.isBold ? FontWeight.bold : FontWeight.normal,
//     fontStyle: data.value.isItalic ? FontStyle.italic : FontStyle.normal,
//     decoration: data.value.isUnderline ? TextDecoration.underline : TextDecoration.none,
//     height: data.value.lineHeight,
//     // color: Color(data.value.hexColor),
//     color: hexToColor(data.value.hexColor),
//   ),
// );

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    // Path path_0 = Path();
    // path_0.moveTo(size.width * -0.0020000, size.height * 0.0050000);
    // path_0.quadraticBezierTo(size.width * 0.0767000, size.height * 0.1552500, size.width * 0.0864000, size.height * 0.2520000);
    // path_0.cubicTo(
    //     size.width * 0.0687000, size.height * 0.3932500, size.width * 0.0189000, size.height * 0.4437500, size.width * 0.0460000, size.height * 0.6050000);
    // path_0.cubicTo(
    //     size.width * 0.0645000, size.height * 0.7077500, size.width * 0.1479000, size.height * 0.6852500, size.width * 0.1088000, size.height * 0.8080000);
    // path_0.quadraticBezierTo(size.width * 0.0636000, size.height * 0.9705000, 0, size.height * 1.0100000);
    // path_0.lineTo(size.width, size.height);
    // path_0.lineTo(size.width * 0.9980000, size.height * -0.0100000);
    // path_0.lineTo(size.width * -0.0020000, size.height * 0.0050000);
    // path_0.close();

     Path path_0 = Path();
    path_0.moveTo(size.width*0.0818182,size.height*0.9090909);
    path_0.lineTo(size.width*0.9090909,size.height*0.9090909);
    path_0.quadraticBezierTo(size.width*0.5363636,size.height*-0.0409091,size.width,0);
    path_0.cubicTo(size.width*0.7522727,size.height*-0.0022727,size.width*0.2568182,size.height*-0.0068182,size.width*0.0090909,size.height*-0.0090909);
    path_0.quadraticBezierTo(size.width*0.4409091,size.height*-0.0477273,size.width*0.0818182,size.height*0.9090909);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0020000, size.height * 0.0050000);
    path_0.quadraticBezierTo(size.width * 0.0767000, size.height * 0.1552500, size.width * 0.0864000, size.height * 0.2520000);
    path_0.cubicTo(
        size.width * 0.0687000, size.height * 0.3932500, size.width * 0.0189000, size.height * 0.4437500, size.width * 0.0460000, size.height * 0.6050000);
    path_0.cubicTo(
        size.width * 0.0645000, size.height * 0.7077500, size.width * 0.1479000, size.height * 0.6852500, size.width * 0.1088000, size.height * 0.8080000);
    path_0.quadraticBezierTo(size.width * 0.0636000, size.height * 0.9705000, 0, size.height * 1.0100000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.9980000, size.height * -0.0100000);
    path_0.lineTo(size.width * -0.0020000, size.height * 0.0050000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyager_1/core/color.dart';

const kWidth = SizedBox(width: 10);

const kHeight = SizedBox(height: 10);
const width70 = SizedBox(width: 70);
const height50 = SizedBox(height: 50);

const tileHeight = SizedBox(height: 20);

const kWidth20 = SizedBox(width: 20);

final borderRadius = BorderRadius.circular(10);
final borderRadius30 = BorderRadius.circular(30);

//textstyle home page

TextStyle ktextHome =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

TextStyle ktextTitle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

TextStyle ktext = GoogleFonts.robotoSlab(
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: kButtonColorBlue,
    decoration: TextDecoration.underline,
    decorationThickness: 2.0,
    decorationColor: Colors.red,
  ),
);

TextStyle fontStyle = GoogleFonts.robotoSlab(
  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
);

TextStyle subFontStyle = GoogleFonts.robotoSlab(
  textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
);

TextStyle textStyle = GoogleFonts.robotoSlab(
  textStyle: const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
);

TextStyle appBarTextStyle = GoogleFonts.robotoSlab(
  textStyle: const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 12, color: kWhiteColor),
);

TextStyle userTextStyle = GoogleFonts.robotoSlab(
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: colorRed,
  ),
);

TextStyle loginRegister = GoogleFonts.robotoSlab(
  textStyle: const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
);

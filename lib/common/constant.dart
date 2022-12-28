import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLOR
const Color kPink = Color(0xFFEF6D6D);
const Color kStrongRed = Color(0xFFEF1D1D);

const Color kMatteBlack = Color(0xFF252525);
const Color kSoftGrey = Color(0xFFEFEFEF);

const Color kSoftGreen = Color.fromARGB(255, 192, 236, 171);
const Color kBrightGreen = Color(0xFF449C1B);
const Color kStrongGreen = Color(0xFF348756);
const Color kLineGreen = Color(0xFF00FF74);

const Color kFats = Color.fromARGB(255, 212, 132, 3);
const Color kCarbs = Color.fromARGB(255, 239, 108, 0);

const Color kBlueSoft = Color.fromRGBO(207, 245, 231, 1);
const Color kYellowSoft = Color.fromRGBO(254, 205, 112,1);

// text style
final TextStyle kAuthScreen = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.bold
);


final TextStyle kTitleScreen = 
GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: FontWeight.w500
);

final TextStyle kSection = 
GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.w500 // medium
);

final TextStyle kBodyText = 
GoogleFonts.poppins(
  fontSize: 12,
  color: Colors.black54
  // fontWeight: FontWeight.w400 // regular
);

final TextStyle kItemTittleCard = 
GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w600 //semibold
);

// logo
final TextStyle kDiatrofi = 
GoogleFonts.notoSerif(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold
);

// color scheme
const kColorScheme = ColorScheme(
  primary: kStrongGreen,
  primaryContainer: kStrongGreen,
  secondary: kSoftGreen,
  secondaryContainer: kSoftGreen,
  surface: kMatteBlack,
  background: kMatteBlack,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
enum ResultState { loading, error, noData, hasData }

class Constants {
  static const String textEmptyData = " Data Kosong";
  static const String textConnectionError = " Koneksi Bermasalah";
}
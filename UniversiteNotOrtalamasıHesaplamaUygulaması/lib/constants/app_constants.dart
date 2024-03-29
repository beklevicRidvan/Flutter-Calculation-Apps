import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const String baslikText = "Ortalama Hesapla";

  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

  static final TextStyle ortalamaDegeriStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w600, color: anaRenk);

  static final TextStyle ortalamaYazisiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anaRenk);

  static final EdgeInsetsGeometry dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final EdgeInsetsGeometry yatayPadding8 =
      const EdgeInsets.symmetric(horizontal: 8);
}

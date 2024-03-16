import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class DersAdiField extends StatefulWidget {
  final Function onDersAdiGirildi;
  const DersAdiField({required this.onDersAdiGirildi,super.key});

  @override
  State<DersAdiField> createState() => _DersAdiFieldState();
}

class _DersAdiFieldState extends State<DersAdiField> {
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
          widget.onDersAdiGirildi(girilenDersAdi);
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders Adını giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }
}

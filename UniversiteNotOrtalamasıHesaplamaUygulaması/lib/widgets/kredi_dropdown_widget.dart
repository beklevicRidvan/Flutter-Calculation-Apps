import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class KrediDropDown extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropDown({required this.onKrediSecildi,super.key});

  @override
  State<KrediDropDown> createState() => _KrediDropDownState();
}

class _KrediDropDownState extends State<KrediDropDown> {

  double secilenKrediDegeri = 1;






  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (girilenDeger) {
          setState(() {
            secilenKrediDegeri = girilenDeger!;
            widget.onKrediSecildi(secilenKrediDegeri);
          });
        },
        items: DataHelper.tumDerslerinKredileri(),
        underline: Container(),
      ),
    );
  }
}

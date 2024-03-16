import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class HarfDropDown extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDown({required this.onHarfSecildi,super.key});

  @override
  State<HarfDropDown> createState() => _HarfDropDownState();
}

class _HarfDropDownState extends State<HarfDropDown> {
  double secilenHarfDegeri = 4;

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
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (girilenDeger) {
          setState(() {
            secilenHarfDegeri = girilenDeger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
        items: DataHelper.tumderslerinHarfleri(),
        underline: Container(),
      ),
    );
  }
}

import 'package:buyuk_dinamik_not_ortalama_hesapla/constants/app_constants.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/helper/data_helper.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/widgets/text_formfield_widget.dart';
import 'package:flutter/material.dart';

import '../model/ders.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Sabitler.baslikText,
          style: Sabitler.baslikStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildForm(),
                flex: 2,
              ),
              Expanded(
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
                flex: 1,
              ),
            ],
          ),
          Expanded(child: DersListesi(
            onElemanCikarildi: (index) {
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {});
            },
          )),
        ],
      ),
    );
  }


  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: DersAdiField(onDersAdiGirildi: (deger){
              girilenDersAdi = deger;
            }),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropDown(onHarfSecildi: (deger){
                    secilenHarfDegeri = deger;
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropDown(onKrediSecildi: (deger){
                    secilenKrediDegeri=deger;
                  }),
                ),
              ),
              IconButton(
                  onPressed: _dersEkleVeOrtalamaHesapla,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Sabitler.anaRenk,
                    size: 30,
                  )),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  /*
  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
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
*/



  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}

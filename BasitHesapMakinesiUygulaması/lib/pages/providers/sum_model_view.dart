import 'package:flutter/material.dart';

class SumModelView with ChangeNotifier{
  String _sonuc="";

  String get sonuc => _sonuc;







  set sonuc(String value) {
    _sonuc = value;
    notifyListeners();
  }
  String printSonuc(String islem){
        return sonuc += islem;

  }

  String printNumber(int sayi){
     return sonuc = sonuc +  sayi.toString();

  }


  String? printResult(){

    if (sonuc.contains("+")){
      var myList = sonuc.split("+");
      double toplam = 0;
      for (var element in myList){
        var myElement =  double.parse(element);
        toplam += myElement;

      }
      return sonuc = toplam.toString();

    }
    else if (sonuc.contains("-")){
      var myList = sonuc.split("-");
      double? toplam;
      if(myList.isNotEmpty && myList != null){
        toplam = double.parse(myList.first);

        for (int i=1;i<myList.length;i++){
          var myElement =  double.parse(myList[i]);
          if(myElement != null){
            if(toplam != null ){
              toplam -= myElement;
            }
          }

        }
        return sonuc = toplam.toString();
      }


    }
    else if (sonuc.contains("x")){
      var myList = sonuc.split("x");
      double toplam = 1;
      for (var element in myList){
        var myElement =  double.parse(element);
        toplam *= myElement;

      }
      return sonuc = toplam.toString();

    }
    else if (sonuc.contains("÷")) {
      var myList = sonuc.split("÷");
      double? toplam;

      if (myList.isNotEmpty && myList.first != null) {
        toplam = double.parse(myList.first!);

        for (var i = 1; i < myList.length; i++) {
          double myElement = double.parse(myList[i]);

          if (myElement != 0) {
            if (toplam != null) {
              toplam /= myElement;
            }
          } else {
            print("Hata: Bölme işlemi sırasında sıfıra bölme!");
            return "ERROR";
          }
        }
      }

      return  sonuc = toplam!.toString() ?? "ERROR";
    }



    else {
        return "0";
      }

  }

  String resetResult(){
    return sonuc ="";
  }





/*
  String _printResult(String islem,int sayi1,int sayi2) {

    switch(islem){
      case "+":
        _sonuc = sayi1 + sayi2;
        return "$_sonuc";

      case "-":
        _sonuc = sayi1 + sayi2;
        return "$_sonuc";

    }

  }
*/





}
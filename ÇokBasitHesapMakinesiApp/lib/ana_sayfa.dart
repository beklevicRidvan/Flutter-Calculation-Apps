import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  TextEditingController tController = TextEditingController();

  double? textFontSize = 30;
  String gecici="";
  String temp="";
  String bir = "1";
  String iki = "2";
  String uc = "3";
  String dort = "4";
  String bes = "5";
  String alti = "6";
  String yedi = "7";
  String sekiz = "8";
  String dokuz = "9";
  bool gorunurluk = false;
  bool changer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("Calculator",style: TextStyle(fontWeight: FontWeight.bold),),
            Divider(color: Colors.red.shade900,height: 1,thickness: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:
                TextFormField(

                  keyboardType: TextInputType.number,
                  controller: tController,
                  decoration: InputDecoration(

                    contentPadding: EdgeInsets.all(16),
                    fillColor: Colors.greenAccent.withOpacity(0.3),
                    prefixIcon: Icon(Icons.calculate),
                    suffixIcon: Visibility(visible: changer,child: Text("=",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),),
                    filled: true,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                ),
                Visibility(
                  visible: gorunurluk,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    width: 120,

                    color: Colors.transparent,
                    child: Text(gecici,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {


                    setState(() {

                      tController.text = "";
                      gorunurluk = false;
                      changer=false;


                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    width: 100,
                    height: 100,
                    child: Text(
                      "A/C",
                      style: TextStyle(
                          color: Colors.white, fontSize: textFontSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      temp = tController.text+"+";
                      tController.text = temp;
                      gorunurluk = false;
                      changer=false;



                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    child: Text(
                      "+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    setState(() {
                      int toplam = 0;


                      if(tController.text.contains("+")){
                        var myArray = tController.text.split("+");

                        for (var eleman in myArray){
                          int sayi = int.parse(eleman);
                          toplam += sayi;
                        }
                        gecici=toplam.toString();
                        gorunurluk=true;
                        changer = true;

                      }
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(
                      "=",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      temp = tController.text+bir;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;

                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    width: 100,
                    height: 100,
                    child: Text(
                      bir,
                      style: TextStyle(
                          color: Colors.white, fontSize: textFontSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      temp = tController.text+iki;
                      tController.text=temp;
                      changer=false;

                      gorunurluk = false;});
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    child: Text(
                      iki,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      temp = tController.text+uc;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;

                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(
                      uc,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      temp = tController.text+dort;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;


                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    width: 100,
                    height: 100,
                    child: Text(
                      dort,
                      style:
                          TextStyle(color: Colors.white, fontSize: textFontSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      temp = tController.text+bes;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;


                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    child: Text(
                      bes,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      temp = tController.text+alti;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;


                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(
                      alti,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      temp = tController.text+yedi;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;


                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    width: 100,
                    height: 100,
                    child: Text(
                      yedi,
                      style:
                          TextStyle(color: Colors.white, fontSize: textFontSize),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      temp = tController.text+sekiz;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;


                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.blueGrey,
                    child: Text(
                      sekiz,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      temp = tController.text+dokuz;
                      tController.text=temp;
                      gorunurluk = false;
                      changer=false;


                    });
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: Text(
                      dokuz,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.white, fontSize: textFontSize),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

int sayilariCikart(int s1,int s2){
  return s1-s2;
}

int sayilariTopla(int s1,int s2){
  return s1+s2;
}

import 'package:buyuk_dinamik_not_ortalama_hesapla/constants/app_constants.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/helper/data_helper.dart';
import 'package:buyuk_dinamik_not_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {


  List<Ders> tumDersler = DataHelper.tumEklenenDersler;
  final Function onElemanCikarildi;

   DersListesi({required this.onElemanCikarildi, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return tumDersler.length>0 ?  ListView.builder(itemCount: tumDersler.length,itemBuilder: (context,index){

      return  Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (s){
          onElemanCikarildi(index);


        },
        child: Padding(

          padding: const EdgeInsets.all(2),
          child: Card(

            child: ListTile(
              title: Text(tumDersler[index].ad),
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Sabitler.anaRenk,
                child: Text((tumDersler[index].harfDegeri*tumDersler[index].krediDegeri).toStringAsFixed(0),style: TextStyle(color: Colors.white),),
              ),
              subtitle: Text("${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
            ),
          ),
        ),
      );

    }) : Container(child: Center(child: Text("Lütfen Ders Ekleyiniz",style: Sabitler.baslikStyle,),),);
  }
}

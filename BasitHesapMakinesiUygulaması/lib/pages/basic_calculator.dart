import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerkendi_ornegim_sayac/pages/providers/sum_model_view.dart';

class BasicCalculator extends StatelessWidget {
  const BasicCalculator({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),

      body: _buildBody(context),
    );
  }

   AppBar _buildAppbar() {
    return AppBar(

      title: const Text("Calculator",style: TextStyle(fontSize: 50),),
      leading: const Icon(Icons.numbers,size: 40,),
      actions: const [

       Icon(Icons.calculate,size: 50,color: Colors.white,),
        SizedBox(width: 10)
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40,right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildResultRow(),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCalculateTools("C", context),
            _buildCalculateTools("+/-", context),
            _buildCalculateTools("%", context),
            _buildCalculateIslem("÷",context),



          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCalculateButton(7,context),
            _buildCalculateButton(8,context),
            _buildCalculateButton(9,context),
            _buildCalculateIslem("x",context),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCalculateButton(4,context),
            _buildCalculateButton(5,context),
            _buildCalculateButton(6,context),
            _buildCalculateIslem("-",context),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCalculateButton(1,context),
            _buildCalculateButton(2,context),
            _buildCalculateButton(3,context),
            _buildCalculateIslem("+",context),
          ],
        ),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           _buildCalculateZero(0,context),
            _buildCalculateButton(".",context),
            _buildCalculateEquals("=",context),




          ],
        ),

      ]
    );
  }

  ElevatedButton _buildCalculateButton(dynamic sayi,BuildContext context) {

    SumModelView modelView = Provider.of<SumModelView>(context,listen: false);

    return ElevatedButton(
        onPressed: (){
          modelView.printNumber(sayi);
        },
      style: ElevatedButton.styleFrom(minimumSize: const Size(40, 80),backgroundColor: Colors.grey.shade900,shape: const CircleBorder()),
        child: Text(sayi.toString(),style: const TextStyle(fontSize: 40,color: Colors.white),),
    );
  }

  ElevatedButton _buildCalculateIslem(String islem,BuildContext context) {
    SumModelView modelView = Provider.of<SumModelView>(context,listen: false);


    return ElevatedButton(
      onPressed: (){
        modelView.printSonuc(islem);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800,shape: const CircleBorder()),
      child: Text(islem,style: const TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w300),),
    );
  }

  ElevatedButton _buildCalculateTools(dynamic sayi,BuildContext context) {

    SumModelView modelView = Provider.of<SumModelView>(context,listen: false);

    return ElevatedButton(
      onPressed: (){
        modelView.resetResult();
      },
      style: ElevatedButton.styleFrom(minimumSize: const Size(40, 80),backgroundColor: Colors.grey.shade400,shape: const CircleBorder()),
      child: Text(sayi.toString(),style: const TextStyle(fontSize: 30,color: Colors.white),),
    );
  }


  ElevatedButton _buildCalculateEquals(String islem,BuildContext context) {
    SumModelView modelView = Provider.of<SumModelView>(context,listen: false);


    return ElevatedButton(
      onPressed: (){
        modelView.printResult();
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800,shape: const CircleBorder()),
      child: Text(islem,style: const TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w300),),
    );
  }

  ElevatedButton _buildCalculateZero(int sayi,BuildContext context) {
    SumModelView viewModel = Provider.of<SumModelView>(context,listen:  false);

    return ElevatedButton(
      onPressed: (){
        viewModel.printNumber(sayi);
      },
      style: ElevatedButton.styleFrom(minimumSize: const Size(40,50),padding:const EdgeInsets.symmetric(horizontal: 70),backgroundColor: Colors.grey.shade900,shape: const StadiumBorder()),
      child:  Text(sayi.toString(),style: const TextStyle(fontSize: 40,color: Colors.white),),
    );
  }

  _buildResultRow() {
   return Consumer<SumModelView>(builder:(context,viewModel,child){
     return Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text(
           viewModel.sonuc,
           style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),

         )
       ],
     );
   });
  }
}

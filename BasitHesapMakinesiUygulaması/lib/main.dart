import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerkendi_ornegim_sayac/pages/basic_calculator.dart';
import 'package:providerkendi_ornegim_sayac/pages/providers/sum_model_view.dart';

void main(){
runApp(const MyHomePage());
}



class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: ChangeNotifierProvider(
        create: (context)=> SumModelView(),child: BasicCalculator(),
      ),
    );
  }
}

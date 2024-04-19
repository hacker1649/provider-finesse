import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slider_example/provider/slider_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Slider Motion', style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context,value,child){
              return Text(value.value.toString(), style: GoogleFonts.ubuntu(fontSize: 25));
            }),
            Consumer<SliderProvider>(builder: (context,value,child){
              return Slider(min:0, max:1, value: value.value, onChanged: (val){value.setSliderValue(val);});
            }),
            SizedBox(height: 20,),
            Consumer<SliderProvider>(builder: (context,value,child){
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Colors.green.withOpacity(value.value),),
                      child: Center(child: Text("Container no.1", style: GoogleFonts.ubuntu(fontSize: 15)),),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Colors.red.withOpacity(value.value),),
                      child: Center(child: Text("Container no.2", style: GoogleFonts.ubuntu(fontSize: 15)),),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

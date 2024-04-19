import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:count_example/provider/count_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter', style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          return Text(value.counter.toString(), style: GoogleFonts.ubuntu(fontSize: 50, fontWeight: FontWeight.normal));
        }),
      ),
      floatingActionButton: Consumer<CountProvider>(builder: (context,value,child){
        return FloatingActionButton(
          onPressed: (){value.setCounter();},
          child: Icon(Icons.add),
        );
      }),
    );
  }
}

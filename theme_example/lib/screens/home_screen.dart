import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:theme_example/provider/theme_provider.dart';

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
          title: Text('Themes Changer', style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Consumer<ThemeProvider>(builder: (context,value,child){
          return Column(
            children: [
              RadioListTile<ThemeMode>(
                title: Text("Light Mode", style: GoogleFonts.ubuntu(fontSize: 15)),
                value: ThemeMode.light, 
                groupValue: value.themeMode, 
                onChanged: value.setTheme,
              ),
              RadioListTile<ThemeMode>(
                title: Text("Dark Mode", style: GoogleFonts.ubuntu(fontSize: 15)),
                value: ThemeMode.dark, 
                groupValue: value.themeMode, 
                onChanged: value.setTheme,
              ),
              RadioListTile<ThemeMode>(
                title: Text("System Default Mode", style: GoogleFonts.ubuntu(fontSize: 15)),
                value: ThemeMode.system, 
                groupValue: value.themeMode, 
                onChanged: value.setTheme,
              ),
            ],
          );
        }),
      ),
    );
  }
}

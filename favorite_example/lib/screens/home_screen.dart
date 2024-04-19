import 'package:favorite_example/provider/favorite_provider.dart';
import 'package:favorite_example/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
          title: Text('Favorites App', style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            InkWell(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: ((context) => FavoritesPage())));},
              child: Icon(Icons.favorite_rounded),
            ),
            SizedBox(width: 22,),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context,index){
                  return Consumer<FavoriteProvider>(builder: (context,value,child){
                    return ListTile(
                      onTap: (){
                        if(value.favoriteItems.contains(index)){
                          value.removeItem(index);
                        }else{
                          value.addItem(index);
                        }
                      },
                      title: Text("Product Item no.$index", style: GoogleFonts.ubuntu(fontSize: 15)),
                      trailing: Icon(
                        value.favoriteItems.contains(index)
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded, 
                        size: 20,
                      ),
                    );
                  });
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

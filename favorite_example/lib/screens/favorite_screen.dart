import 'package:favorite_example/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Favorite Items Page', style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<FavoriteProvider>(builder: (context,value,child){
                return ListView.builder(
                  itemCount: value.favoriteItems.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        value.removeItemAtIndex(index);
                      },
                      title: Text("Product Item no.${value.favoriteItems[index]}", style: GoogleFonts.ubuntu(fontSize: 15)),
                      trailing: Icon(Icons.delete_rounded, size: 20,),
                    );
                  }
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

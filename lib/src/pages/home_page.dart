import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_downloader/image_downloader.dart';
import 'package:instagramdownloader/src/providers/items_provider.dart';
//import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://instagram.fbjx1-1.fna.fbcdn.net/vp/cbe8351a9f3f8ea2ea139f4a87ba0ab3/5DD1D0EF/t51.2885-15/sh0.08/e35/s640x640/61758089_2352523195018442_5796448645383026335_n.jpg?_nc_ht=instagram.fbjx1-1.fna.fbcdn.net';

  final itemsProvider = new ItemsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          _cuerpo()
        ],
      ),
    );
  }


  Widget _cuerpo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () => _procesarCall(),
            iconSize: 48.0,
            color: Color.fromRGBO(188, 146, 252, 1.0),
          ),  
        )
        
      ]
    );
  }

  _procesarCall() {

    itemsProvider.fetchItem();

  }

  void _getImage() async {
    ClipboardData data =  await Clipboard.getData('text/plain');
    String d = data.text.substring(28,39);
    print(d); //clave del post
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage("https://www.instagram.com/p/$d/media/?size=l");
      if (imageId == null) {
        return;
      }
      print(await ImageDownloader.findPath(imageId));
      // Below is a method of obtaining saved image information.
      // var fileName = await ImageDownloader.findName(imageId);
      // var path = await ImageDownloader.findPath(imageId);
      // var size = await ImageDownloader.findByteSize(imageId);
      // var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }


  
  Widget _fondoApp(){
    
      final cajaRosa = Transform.rotate(
        angle: pi/3,
        child: Container(
          height: 460.0,
          width: 460.0,
          decoration: BoxDecoration(
          color: Color.fromRGBO(188, 146, 252, 1.0),
            borderRadius: BorderRadius.circular(230.0)
          ),
        ),
      );
    
    

      return Stack(
        children: <Widget>[
          Positioned(
            child:cajaRosa,
            top: -210.0,
            right: -100.0,
          )
          
        ],
      );

  }

}
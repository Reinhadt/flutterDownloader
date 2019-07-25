import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:instagramdownloader/src/models/item_model.dart';

class ItemsProvider{

  String _url = 'www.instagram.com';

  Future <Item> _procesarRespuesta(Uri uri) async{
    final resp = await http.get(uri); //llamamos la url por método get
    final decodedData = json.decode(resp.body); //lo pasamos a json

    //llama al modelo Películas y toma cada elemento de la lista, creando una instancia de Película para cada elemento
    //retornamos una lista de items
    final items = new Item.fromJson(decodedData['graphql']);

    return items; //items es una lista de películas
  }

  Future <Item> fetchItem() async{
    
    ClipboardData data =  await Clipboard.getData('text/plain');
    String d = data.text.substring(28,39);

    final url = Uri.https(_url, '/p/$d/', {
      '__a': '1'
    });

    print(url);
    final resp = await _procesarRespuesta(url);
    //IMPLEMENTA EL CONTENIDO DE LA LISTA DE EDGES EN EL MODELO PORFAS
    print(resp.shortcodeMedia.edgeSidecarToChildren.edges[0]);
    return resp;
  }

}
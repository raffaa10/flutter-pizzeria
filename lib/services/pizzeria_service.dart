import 'dart:convert';
import 'package:pizzeria/models/pizza.dart';
import 'package:http/http.dart' as http;

class PizzeriaService {

  //static final String uri = 'http://172.17.64.1:8099/api';
  //static final String uri = 'http://172.17.32.1:8000/api';
  //static final String uri = 'http://localhost:80/api/';

  static final String uri = 'http://192.168.1.19:80/api';

  /* Dans le fichier index.php
  * - Il faut supprimer la ligne : $json[] = array();
  * - et ajouter cette ligne à la fin echo json_encode($json);
  * - dans url d'image il faut changer sur http://192.168.1.19:80/
  */

  Future<List<Pizza>> fetchPizzas() async {

    List<Pizza> list = [];
    try {
      final response = await http
          .get(Uri.parse('$uri/pizzas'));
      if(response.statusCode == 200) {
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for(final value in json) {
          list.add(Pizza.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les pizzas');
      }
    } catch (e) {
      throw e;
    }
    return list;
  }

}
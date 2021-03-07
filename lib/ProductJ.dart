import 'dart:async';
import 'dart:convert' ;
import 'package:http/http.dart' as http;

import './Product.dart';

Future<ProductJ> fetchProductJ() async {
  final response = await http.get(Uri.http('192.168.1.69:3030', '/product')); //Change to your ip
  if (response.statusCode == 200) {
    // print(response.body);
// If the server did return a 200 OK response,
// then parse the JSON.
    return ProductJ.fromJson(jsonDecode(response.body), null, null, null, null, null);
  } else {
// If the server did not return a 200 OK response,
// then throw an exception.
    throw Exception('Failed to load ProductJ');
  }
}

class ProductJ {
  final int id;
  final int price;
  final String title, image, description;

  static List<Product> productsJ = [];

  ProductJ({this.id, this.price, this.title, this.image, this.description});

  ProductJ.fromJson(Map<String, dynamic> json, this.id, this.price, this.title, this.image, this.description) {
    // print(json['products'][0]['title']);
    for(int i = 0; i < json['products'].length; i++){
      productsJ.add(Product(
          id: json['products'][i]['id'],
          price: json['products'][i]['price'],
          title : json['products'][i]['title'],
          image: json['products'][i]['image'],
          description: json['products'][i]['description']
      ));
    }
    // print(productsJ);
  }
}

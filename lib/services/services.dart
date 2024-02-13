import 'package:http/http.dart' as http;

import '../model/post_model.dart';

var base="https://dummyjson.com";

getpost()async{
  var response= await http.get(Uri.parse("$base/products"));
  if(response.statusCode==200){
    try{
      // data successfully fetched
    var content=postmodelFromJson(response.body);
    return content.products;
    }catch(e){
      print('Erroe encountered $e');
    }
  }
}
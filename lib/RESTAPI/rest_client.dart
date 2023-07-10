import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

productCreateRequest(formValues) async{
  var url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var postBody = jsonEncode(formValues);
  var postHeader = {"Content-Type": "application/json"};

  var response =  await http.post(url, body: postBody, headers: postHeader);
}
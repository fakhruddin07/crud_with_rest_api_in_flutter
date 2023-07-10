import 'dart:convert';
import 'package:crud_with_rest_api_in_flutter/Style/style.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<List> productGetRequest() async{
  Uri url = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  Response response = await http.get(url);
  final decodedResponse = jsonDecode(response.body);

  if(response.statusCode == 200 && decodedResponse["status"] == "success"){
    successToast("Request success");
    return decodedResponse["data"];
  }else{
    errorToast("Request fail! Try again");
    return [];
  }
}

Future<bool> productCreateRequest(formValues) async{
  Uri url = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  String postBody = jsonEncode(formValues);
  Map<String, String> postHeader = {"Content-Type": "application/json"};
  Response response =  await http.post(url, body: postBody, headers: postHeader);
  final Map<String, String> decodedResponse = jsonDecode(response.body);

  if(response.statusCode == 200 && decodedResponse["status"] == "success"){
    successToast("Request success");
    return true;
  }else{
    errorToast("Request fail! Try again");
    return false;
  }
}
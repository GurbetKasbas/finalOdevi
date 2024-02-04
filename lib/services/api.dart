//Sunucu İstekleri

import 'package:dio/dio.dart';

class API {

  final Dio dio =Dio();
  final String baseUrl ="http://key1.tech/api";

  login ( String username, String password ) async {

    try{
      final String endpoint ="$baseUrl/login";

      final  params ={
        "email":username, 
        "password": password,

      };

      final response = await dio.post(endpoint,data:FormData.fromMap(params));
      return response.data;
    }catch(e){
      return e;
    }
  }

  signup ( String username, String password , String name, String phone ) async {

    try{
      final String endpoint ="$baseUrl/signup";

      final  params ={
        "name":name,
        "phone":phone,
        "email":username, 
        "password": password,

      };

      final response = await dio.post(endpoint,data:FormData.fromMap(params));
      return response.data;
    }catch(e){
      return e;
    }
  }



}
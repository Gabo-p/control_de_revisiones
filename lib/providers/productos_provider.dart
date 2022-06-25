import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mavex_app/utils/configuraciones.dart';
import 'package:http/http.dart' as http;
import 'package:mavex_app/models/productos_model.dart';
import 'package:get/get.dart';

class ProductosProvider {
  
  Future<List<Producto>> obtenerProductos()async{
    final Map<String, dynamic> authData = {
      'operation': Sistema.obtenerProductos,
    };

    try {
        
      final url = Sistema.enviroment == 'local' ? Uri.http(Sistema.host, '/api/') : Uri.https(Sistema.host, '/api/');
      final resp = await http.post(url, body: json.encode(authData),  headers: {
        'Content-Type':'application/json; charset=utf-8',
        'charset':'utf-8'
      }).timeout(const Duration(seconds: 4));
      
      
      if(resp.statusCode == 200){
        final List<Producto> decodeResp = productoFromJson(resp.body);
        return decodeResp;
      }else {
        return [];
      }

    } on TimeoutException catch (_) {
      Get.snackbar(
        'El servidor no ha respondido a tiempo',
        'Ha ocurrido un error en el servidor',
        colorText: const Color(0xffE84343),
        shouldIconPulse: true,
        icon: const Icon(Icons.miscellaneous_services_rounded, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException { 
      return []; 
    } on HttpException {
      return [];
    } on FormatException catch (_) {
      return [];
    } catch (e) {
      Get.snackbar(
        'Ha ocurrido un error',
        'peticion erronea',
        colorText: const Color(0xffE84343),
        shouldIconPulse: true,
        icon: const Icon(Icons.miscellaneous_services_rounded, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );    
      return [];
    }
  }


}
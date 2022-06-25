import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mavex_app/utils/configuraciones.dart';



class SolicitudesProvider {
  

  Future<bool> solicitarRevision( String correo ) async{
    
    final Map<String, dynamic> authData = {
      'operation': Sistema.solicitarRevision,
      'user' : {
        'email' : correo,
        'password' : ''
      }
    };

    try {
        
      final url = Sistema.enviroment == 'local' ? Uri.http(Sistema.host, '/api/') : Uri.https(Sistema.host, '/api/');
      final resp = await http.post(url, body: json.encode(authData),  headers: {
        'Content-Type':'application/json; charset=utf-8',
        'charset':'utf-8'
      }).timeout(const Duration(seconds: 4));
      
      
      if(resp.statusCode == 200){
        return true;
      }else {
        return false;
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
      return false;
    } on SocketException { 
      return false; 
    } on HttpException {
      return false;
    } on FormatException catch (_) {
      return false;
    } catch (e) {
      Get.snackbar(
        'Ha ocurrido un error',
        'Intentalo de nuevo',
        colorText: const Color(0xffE84343),
        shouldIconPulse: true,
        icon: const Icon(Icons.miscellaneous_services_rounded, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );    
      return false;
    }
  }


}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mavex_app/models/usuario_model.dart';
import 'package:mavex_app/providers/auth_provider.dart';

class LoginController extends GetxController {

  // ? Valores de los inputs 
  var correo     = ''.obs;
  var contrasena = ''.obs;

  // ? Valores de los verificadores de campos
  var correoVerificado = false.obs; 
  var contrasenaVerificado = false.obs; 

  // ? Valores de los verificadores de campos para errores
  var correoError = false.obs;
  var contrasenaError = false.obs;

  // ? Funcion para verificar
  void verificarCorreo(String inputCorreo){
    if(inputCorreo.isNotEmpty && inputCorreo.length > 4){
      correo.value = inputCorreo;
      // ? Expresion regular para verificar correo
      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);

      if(regExp.hasMatch(inputCorreo)){
        correoVerificado.value = true;
      }else{
        correoVerificado.value = false;
      }
    }
  }

  void verificarContrasena(String inputContrasena){
    if(inputContrasena.isNotEmpty && inputContrasena.length > 5){
      contrasena.value = inputContrasena;
      contrasenaVerificado.value = true;
    }else{
      contrasenaVerificado.value = false;
    }
  }

  void verificarCampos(){
    final empresa = GetStorage('empresa');
    if(correoVerificado.value && contrasenaVerificado.value){
      AuthProvider().login(correo.value, contrasena.value ).then((LoginResponse? response){
        if(response != null){
          if(response.result == 'success'){
            empresa.write('login', true);
            empresa.write('nombre',    response.usuario!.name);
            empresa.write('email',     response.usuario!.email);
            empresa.write('phone',     response.usuario!.phone);
            empresa.write('lastrev',   response.usuario!.lastRev);
            empresa.write('sigrev',   response.usuario!.sigRev);
            empresa.write('documents', response.usuario!.documents);
            empresa.write('id',        response.usuario!.id);

            Get.snackbar(
              'Login Correcto',
              'Se ha iniciado sesion',
              // borderRadius: 0,
              // leftBarIndicatorColor: Colors.red,
              colorText: Colors.white,
              shouldIconPulse: true,
              backgroundColor: const Color.fromARGB(255, 50, 198, 53),
              icon: const Icon(Icons.check, color: Colors.white),
              snackPosition: SnackPosition.BOTTOM,
            );
            Get.toNamed('/empresa');
          }else{
            Get.snackbar(
              'Campos incorrectos',
              'Rellena correctamente los campos',
              // borderRadius: 0,
              // leftBarIndicatorColor: Colors.red,
              colorText: const Color(0xffE84343),
              shouldIconPulse: true,
              icon: const Icon(Icons.miscellaneous_services_rounded, color: Colors.red),
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
      });
    }else{
      Get.snackbar(
        'Campos incompletos',
        'Rellena todos los campos completamente antes de proceder',
        // borderRadius: 0,
        // leftBarIndicatorColor: Colors.red,
        colorText: const Color(0xffE84343),
        shouldIconPulse: true,
        icon: const Icon(Icons.miscellaneous_services_rounded, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
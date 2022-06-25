import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mavex_app/models/productos_model.dart';
import 'package:mavex_app/models/usuario_model.dart';
import 'package:mavex_app/models/video_model.dart';
import 'package:mavex_app/providers/productos_provider.dart';
import 'package:mavex_app/providers/solicitudes_provider.dart';
import 'package:mavex_app/providers/videos_provider.dart';

class EmpresaController extends GetxController {

  final empresaStorage = GetStorage('empresa');
  Rx<String> revision = ''.obs;
  var productos = <Producto>[].obs;
  var videos = <Video>[].obs;
  Rx<Usuario> empresa = Usuario(id: '', name: 'Nombre de la Empresa', phone: '', email: '', lastRev: '', sigRev: '', documents: '').obs;
  
  EmpresaController(){
    empresa.value = Usuario(
      id: empresaStorage.read('id') ?? '', 
      name: empresaStorage.read('nombre') ?? '', 
      phone: empresaStorage.read('phone') ?? '', 
      email: empresaStorage.read('email') ?? '', 
      sigRev: empresaStorage.read('sigrev') ?? '', 
      lastRev: empresaStorage.read('lastrev') ?? '', 
      documents: empresaStorage.read('documents') ?? ''
    );
    ProductosProvider().obtenerProductos().then((value) => productos.value = value);
    VideosProvider().obtenerVideos().then((value) => videos.value = value);
  }

  void eliminarDatos(){
    empresaStorage.remove('id');
    empresaStorage.remove('nombre');
    empresaStorage.remove('phone');
    empresaStorage.remove('email');
    empresaStorage.remove('sigrev');
    empresaStorage.remove('lastrev');
    empresaStorage.remove('documents');
    empresaStorage.remove('login');
  }


  List<Widget> obtenerRevisiones(){
    List revisones = json.decode(empresaStorage.read('documents'));
    List<Widget> listado = [];
    for (var i = 0; i < revisones.length; i++) {
      listado.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: (){
              revision.value = 'http://mavexhn.com/images/reportes/${revisones[i][0]}';
              Get.toNamed('/revision');
            },
            child: Container(
              width: Get.width * 0.7,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(95, 129, 129, 129)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(revisones[i][1], style: const TextStyle(fontWeight: FontWeight.bold),),
                  const Icon(Icons.picture_as_pdf)
                ],
              ),
            ),
          ),
        )
      );
    }
    return listado;
  }


  void solicitarRevision(){
    SolicitudesProvider().solicitarRevision(empresaStorage.read('email') ?? '').then((value){
      if(value){
        Get.snackbar(
          'Se ha enviado la solicitud',
          'Te contactaremos pronto.',
          colorText: Colors.white,
          shouldIconPulse: true,
          backgroundColor: const Color.fromARGB(255, 50, 198, 53),
          icon: const Icon(Icons.check, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }) ;
  }


}

import 'package:get/get.dart';
import 'package:mavex_app/models/productos_model.dart';
import 'package:mavex_app/models/video_model.dart';
import 'package:mavex_app/providers/productos_provider.dart';
import 'package:mavex_app/providers/videos_provider.dart';



class InvitadoController extends GetxController{

  var productos = <Producto>[].obs;
  var videos = <Video>[].obs;


  InvitadoController(){
    ProductosProvider().obtenerProductos().then((value) => productos.value = value);
    VideosProvider().obtenerVideos().then((value) => videos.value = value);

  }



  
  




}
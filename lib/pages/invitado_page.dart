import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavex_app/controllers/invitado_controller.dart';
import 'package:mavex_app/models/productos_model.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:mavex_app/models/video_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class CodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InvitadoController());
  }
}

class InvitadoPage extends GetView<InvitadoController> {
  const InvitadoPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Get.put(InvitadoController());

    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.center,
            child: Text(
              'Invitado',
              style: TextStyle(color: Color(0xff333333)),
            )),
        backgroundColor: const Color(0xffF2F2F2),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text(
                'Iniciar sesión',
                style: TextStyle(color: Color(0xff4D4D4D)),
              ),
              onTap: (){
                Get.toNamed('/login');
              },
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Obx(()=>Column( 
          children: <Widget>[
            const SizedBox(
              height: 20,
            ), 
            
            _buildSubtituloText('Últimos videos'),
            const SizedBox(
              height: 20,
            ),

            Column(
              children: [
                ListVideos(videos: controller.videos)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            _buildSubtituloText('¡Nuestros Productos!'),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: _buildModulosList(controller.productos),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildSubtituloText(String texto) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        texto,
        style: const TextStyle(
          fontFamily: 'Nunito-Bold',
          fontSize: 15,
          color: Color(0xff333333),
          height: 1.2,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  

  //------------------------------------------------------------------------------
  List<Widget> _buildModulosList(List<Producto> modulos) {
    List<Widget> elements = [];
    for (int i = 0; i < modulos.length; i++) {
      Future.delayed(const Duration(milliseconds: 500), () async {
      });
        if (i + 1 < modulos.length) {
          var row = Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductoItemPage(modulos[i]),
              ProductoItemPage(modulos[i + 1]),
            ],
          );
          elements.add(row);
          i++;
        } else {
          elements.add(
            ProductoItemPage(modulos[i]),
          );
        }
        elements.add(
          const SizedBox(
            height: 10.0,
          ),
        );
    }


    return elements;
  }
}


class ProductoItemPage extends GetView<InvitadoController> {

  const ProductoItemPage(this.producto, {Key? key}) : super(key: key);
  final Producto producto;


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 122,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: GestureDetector(
              onTap: (){
                showImageViewer(context,Image.network(
                  "http://mavexhn.com/images/productos/" + producto.img,
                ).image);
              },
              child: Center(
                child: Hero(
                  tag: "smallImage"+ producto.id,
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(16),
                    child: InteractiveViewer(
                      child: Image.network(
                        "http://mavexhn.com/images/productos/" + producto.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  producto.nombre,
                  style: const TextStyle(fontSize: 9.5),
                ),
                const SizedBox(
                  height: 5, 
                ),
                Text(
                  producto.descripcion,
                  style: const TextStyle(fontSize: 8,color: Colors.black54),
                ),
                const SizedBox(
                  height: 5, 
                ),
                _buildOrdenarBoton(context),
              ],
            ),
          ),
        ],
      ),
      decoration: const BoxDecoration(
          color: Color(0xffe6e7e8),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          )),
    );
  }

  //------------------------------------------------------------------------------
  Widget _buildOrdenarBoton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0),
      child: ButtonTheme(
        minWidth: 160.0,
        height: 16.0,
        child: ElevatedButton(
          onPressed: _ordenDialog,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffED383C)),
            minimumSize: MaterialStateProperty.all<Size>(const Size(160, 16)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
            )
          ),
          child: const Text('¡Contáctanos!',
            style: TextStyle(
              fontFamily: 'Nunito-SemiBold',
              fontSize: 8,
              color: Color(0xffffffff),
              height: 1,
            )
          ),
        ),
      ),
    );
  }

  void _ordenDialog() {
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return OrdenInvitadoDialogBox(
    //         title: "Cuadro de dialogo personalizable",
    //         descriptions:
    //             "Cuadro de dialogo",
    //         text: "Yes",
    //         producto: producto,
    //       );
    //     });
  }
}





class ListVideos extends StatefulWidget {

  const ListVideos({required this.videos, Key? key}) : super(key: key);

  final List<Video> videos;

  @override
  State<ListVideos> createState() => _ListVideosState();
}

class _ListVideosState extends State<ListVideos> {
  @override
  Widget build(BuildContext context) {
    final Size _ss = MediaQuery.of(context).size;
    final _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: 0,
    );

    return SizedBox(
      height: _ss.height * 0.25,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: false,
        itemCount: widget.videos.length,
        itemBuilder: (context, i) => _videosSli(context,widget.videos[i]),
        // children: _tarjetas(),
      )
    );
  }



  Widget _videosSli(context, video){
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.elliptical(5.0,5.0)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: VideoSlider(
            videosPlayerController: VideoPlayerController.network('https://mavexhn.com/images/videos/${video.nombre}'),          ),
        ),
    );
  }
}





class VideoSlider extends StatefulWidget {

  final VideoPlayerController videosPlayerController;
  const VideoSlider({Key? key, required this.videosPlayerController}) : super(key: key);

  @override
  _VideoSliderState createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {

  ChewieController? chewieController;

  @override
  void initState() { 
    
    chewieController = ChewieController(
      looping: false,
      aspectRatio: 16/9,
      autoInitialize: true,
      videoPlayerController: widget.videosPlayerController
    );
    super.initState();
  }

  @override
  void dispose() { 
    
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController!,
    );
  }
}
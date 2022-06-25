import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavex_app/controllers/empresa_controller.dart';
import 'package:mavex_app/models/productos_model.dart';
import 'package:mavex_app/pages/invitado_page.dart';

class CodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmpresaController());
  }
}

class EmpresaPage extends GetView<EmpresaController> {
  const EmpresaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EmpresaController());
    final Size _ss = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                'Cerrar sesión',
                style: TextStyle(color: Color(0xff4D4D4D)),
              ),
              onTap: (){Get.toNamed('/');controller.eliminarDatos();},
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Builder(builder: (context) => GestureDetector(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.menu),
              ),
            )
          )
        ],
        title: Align(
            alignment: Alignment.center,
            child: Text(
              controller.empresa.value.name,
              style: const TextStyle(color: Color(0xff333333)),
            )),
        backgroundColor: const Color(0xffF2F2F2),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        primary: false,
        children: [
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Proxima Revision',
                style: TextStyle(
                  fontFamily: 'Nunito-SemiBold',
                  fontSize: 12,
                  color: Color(0xff333333),
                  height: 1.1666666666666667,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _ss.width * 0.7,
                height: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.empresa.value.sigRev,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE6E7E8),
                  border: Border.all(
                    color: const Color(0xffE6E7E8),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ultima Revisión',
                style: TextStyle(
                  fontFamily: 'Nunito-SemiBold',
                  fontSize: 12,
                  color: Color(0xff333333),
                  height: 1.1666666666666667,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _ss.width * 0.7,
                height: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      controller.empresa.value.lastRev,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE6E7E8),
                  border: Border.all(
                    color: const Color(0xffE6E7E8),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 0),
                child: ButtonTheme(
                  minWidth: 150.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: _ss.width * 0.8,
                                  height: _ss.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ListView(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text('Revisiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: controller.obtenerRevisiones(),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                          
                        }
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffED383C)), 
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))
                    ),
                    child: const Text('Ver todas las revisiones',
                      style: TextStyle(
                        fontFamily: 'Nunito-SemiBold',
                        fontSize: 10,
                        color: Color(0xffffffff),
                        height: 1.2,
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 0),
                child: ButtonTheme(
                  minWidth: 150.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: controller.solicitarRevision,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff333333)), 
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))
                    ),
                    child: const Text('Solicitar revision inmediata',
                      style: TextStyle(
                        fontFamily: 'Nunito-SemiBold',
                        fontSize: 10,
                        color: Color(0xffffffff),
                        height: 1.2,
                      )
                    ),
                    
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 35,),
          Obx(() =>  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Ultimos Videos', style: TextStyle(color: Colors.black54, fontSize: 17),)
                ],
              ),
              const SizedBox(height: 10,),
              ListVideos(videos: controller.videos),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '¡Nuestros Productos!',
                  style: TextStyle(
                    fontFamily: 'Nunito-Bold',
                    fontSize: 15,
                    color: Color(0xff333333),
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: _buildModulosList(controller.productos),
              ),
            ],
          )),
        ],
      ),
    );
  }

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














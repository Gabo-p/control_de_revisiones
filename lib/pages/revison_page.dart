import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavex_app/controllers/empresa_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class RevisionPage extends GetView<EmpresaController> {
  const RevisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EmpresaController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisión'),
        actions: const [
          // Icon(Icons.close, color: Colors.white,)
        ],
      ),
      body: Center(
        child: SfPdfViewer.network(controller.revision.value)
      ),
    );
  }
}



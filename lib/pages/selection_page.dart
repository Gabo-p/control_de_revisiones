import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 200,
          ),
          Image.asset(
            'assets/images/img_mavex.png',
            width: 400,
          ),
          const IniciarSessionButton(),
          const InvitadoButton(),
        ]),
      )
    );
  }
}



class InvitadoButton extends StatelessWidget {
  const InvitadoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(top: 0, left: 0),
       child: ElevatedButton(
         onPressed: () {
           Get.toNamed('/invitado');
         },
         style: ButtonStyle(
           minimumSize: MaterialStateProperty.all<Size>(const Size(230, 40)),
           backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff003b7a)),
           elevation: MaterialStateProperty.all<double>(6),
           shape: MaterialStateProperty.all<OutlinedBorder>(
             RoundedRectangleBorder(
               borderRadius:  BorderRadius.circular(20.0),
             )
           )
         ),
         child: const Text('Inicia como invitado', style: TextStyle(color: Colors.white, fontSize: 15.0)),
       ),
     );
  }
}


class IniciarSessionButton extends StatelessWidget {
  const IniciarSessionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size(230, 40)),
          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff003b7a)),
          elevation: MaterialStateProperty.all<double>(6),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )
          )
        ),
        child: const Text('Inicia sesión', style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
    );
  }
}
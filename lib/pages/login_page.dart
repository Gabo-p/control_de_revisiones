import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavex_app/controllers/login_controller.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  // artes@marketingspacehn.com
  // 6e7194eb47

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              'assets/images/img_mavex.png',
              width: 400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              'assets/images/img_user.png',
              width: 110,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const InputUser(),
          const SizedBox(
            height: 15,
          ),
          const InputPassword(),
          const SizedBox(
            height: 20,
          ),
          const LoginButton(),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 15,
          ),
        ]),
      )
    );
  }
}

class InputPassword extends GetView<LoginController> {
  const InputPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Container(
      width: 300,
      child: TextField(
        onChanged: controller.verificarContrasena,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: inputDecorationLogin.copyWith(
          hintText: 'Contraseña:',
          hintStyle: const TextStyle(
            fontFamily: 'JosefinSans-Thin',
            fontSize: 16,
            color: Color(0xff58595b),
            height: 1,
          ),
          suffixIcon: Image.asset('assets/images/ic_password.png',),
        ),
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
    );
  }
}


class InputUser extends GetView<LoginController> {
  const InputUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Container(
      width: 300,
      child: TextField(
        onChanged: controller.verificarCorreo,
        keyboardType: TextInputType.text,
        decoration: inputDecorationLogin.copyWith(
          hintText: 'Usuario:',
          hintStyle: const TextStyle(
            fontFamily: 'JosefinSans-Thin',
            fontSize: 16,
            color: Color(0xff58595b),
            height: 1,
          ),
          suffixIcon: Image.asset('assets/images/ic_username.png'),
        ),
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
    );
  }
}



class LoginButton extends GetView<LoginController> {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0),
      child: ButtonTheme(
        minWidth: 230.0,
        height: 40.0,
        child: ElevatedButton(
          onPressed: controller.verificarCampos,
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(const Size(230, 40)),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffED383C)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              )
            )
          ),
          child: const Text('Iniciar Sesion', style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
      ),
    );
  }
}


const InputDecoration inputDecorationLogin = InputDecoration(
  contentPadding: EdgeInsets.all(12.0),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
);
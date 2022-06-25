import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mavex_app/utils/routes.dart';

void main() async {
  await GetStorage.init();
  await GetStorage.init('empresa');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final login = GetStorage('empresa').read('login');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mavex App',
      getPages: routes,
      initialRoute: login != null && login == true ?  '/empresa' : '/',
    );
  }
}
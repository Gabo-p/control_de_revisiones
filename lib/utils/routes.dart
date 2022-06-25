import 'package:get/get.dart';
import 'package:mavex_app/pages/empresa_page.dart';

import 'package:mavex_app/pages/login_page.dart';
import 'package:mavex_app/pages/invitado_page.dart';
import 'package:mavex_app/pages/revison_page.dart';
import 'package:mavex_app/pages/selection_page.dart';


final routes = [
  GetPage(name: '/', page: () => const SelectionPage()),
  GetPage(name: '/login', page: () => const LoginPage()),
  GetPage(name: '/invitado', page: () => const InvitadoPage()),
  GetPage(name: '/empresa', page: () => const EmpresaPage()),
  GetPage(name: '/revision', page: () => const RevisionPage()),
];
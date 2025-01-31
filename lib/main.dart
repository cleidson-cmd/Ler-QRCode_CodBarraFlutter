import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/gerar_datamatrix_gs1.dart';
import 'package:qrcode/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //name= rota; page = pagina a ser carregada ; ferramenta do Getx
      getPages: [
        GetPage(name: "/", page: () => Home()),
        GetPage(
            name: "/DataMatrixGenerator",
            page: () => DataMatrixGenerator(data: '')),
      ],
    );
  }
}

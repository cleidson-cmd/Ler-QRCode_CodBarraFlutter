import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key}) {
    //chamando minha Hme controler a partir do construtor
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Scanner BarCode",
      )),
      body: SizedBox.expand(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Valor codigo de barras",
            style: Get.theme.textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 6, 58, 153)),
          ),
          GetBuilder<HomeController>(
              //getbuilder reconstroi a tela sempre que a varialvel tem seu valor modificado
              // init: HomeController, // posso inicializar aqui caso não tenha inicializado nesta pagina
              initState: (_) {},
              builder: (controller) {
                return Text(
                  controller.valorCodigoBarra, //variavel do meu controller
                  style: Get.theme.textTheme.headline5,
                );
              }),
          SizedBox(
            height: 10,
          ),
          TextButton.icon(
              onPressed: () {
                Get.find<HomeController>().scannearCode();
              },
              icon: Icon(Icons.qr_code_scanner),
              label: Text("Ler codigo de barra",
                  style: Get.theme.textTheme.headline6))
        ]),
      ),
    );
  }
}

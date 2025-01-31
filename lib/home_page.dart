import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrcode/drop.dart';
import 'package:qrcode/home_controller.dart';
import 'package:qrcode/ultil.dart';

class Home extends StatelessWidget {
  static String resultado = '';
  static int posicaoTipoScan = 0;
  Home({super.key}) {
    //chamando minha Hme controler a partir do construtor
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/DataMatrixGenerator', arguments: {'data', ''});
                },
                icon: const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Colors.black,
          title: const Center(
            child: Text("Scanner",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          )),
      body: SizedBox.expand(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DropdownExample(),
          Text(
            "Resultado aqui 😉",
            style: Get.theme.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 6, 58, 153)),
          ),
          GetBuilder<HomeController>(
              //getbuilder reconstroi a tela sempre que a varialvel tem seu valor modificado
              // init: HomeController, // posso inicializar aqui caso não tenha inicializado nesta pagina
              initState: (_) {},
              builder: (controller) {
                return Text(
                  controller.valorCodigoBarra, //variavel do meu controller
                  style: Get.theme.textTheme.headlineSmall,
                );
              }),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
              onPressed: () {
                Get.find<HomeController>().scannearCode();
              },
              icon: const Icon(Icons.barcode_reader),
              label: Text("Ler codigo de barra",
                  style: Get.theme.textTheme.headlineSmall)),
          TextButton.icon(
              onPressed: () {
                Get.find<HomeController>().scannearQrCode();
              },
              icon: const Icon(Icons.qr_code_scanner),
              label:
                  Text("Ler QrCode", style: Get.theme.textTheme.headlineSmall)),
          TextButton.icon(
              onPressed: () {
                ClipBoardHelper.copy(resultado);
              },
              icon: const Icon(Icons.copy),
              label: Text("Copiar", style: Get.theme.textTheme.headlineSmall)),
        ]),
      ),
    );
  }
}

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var valorCodigoBarra = '';

  Future<void> scannearCode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancelar', true, ScanMode.BARCODE);
    //cor, nome botão cancelar, botão para abrir flash do celular, scanmode define se é qrcode ou code barra
    if (barcodeScanRes == "-1") {
      //se retornar -1 é porque o scanner foi cancelado ou interrompido e não conseguiu concluir a leitura
      Get.snackbar(
        "Aviso",
        "Scanner Cancelado",
      );
    } else {
      // caso contrario ele conseguiu ler
      valorCodigoBarra = barcodeScanRes;
      update(); //update faz parte do pacode GetX e ele atualiza a variavel para que reconstrua esse valor nas telas que estão usando ela dentro do GetBuilder
    }
  }
}

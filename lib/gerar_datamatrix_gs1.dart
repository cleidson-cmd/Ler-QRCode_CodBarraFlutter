import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:qrcode/home_controller.dart';
import 'package:qrcode/home_page.dart';

class DataMatrixGenerator extends StatelessWidget {
  final String data;

  DataMatrixGenerator({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('Scanner',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Center(
        child: GetBuilder<HomeController>(
            //getbuilder reconstroi a tela sempre que a varialvel tem seu valor modificado
            // init: HomeController, // posso inicializar aqui caso não tenha inicializado nesta pagina
            initState: (_) {},
            builder: (controller) {
              return BarcodeWidget(
                barcode:
                    tipoQr(Home.posicaoTipoScan), // Barcode type and settings
                data: controller.valorCodigoBarra,
                width: 200,
                height: 200,
              );
            }),
      ),
    );
  }

  Barcode tipoQr(int posicaoTipo) {
    switch (posicaoTipo) {
      case 0:
        return Barcode.aztec();
      case 1:
        return Barcode.codabar();
      case 2:
        return Barcode.code128();
      case 3:
        return Barcode.code39();
      case 4:
        return Barcode.code93();
      case 5:
        return Barcode.dataMatrix();
      case 6:
        return Barcode.ean13();
      case 7:
        return Barcode.ean2();
      case 8:
        return Barcode.ean5();
      case 9:
        return Barcode.ean8();
      case 10:
        return Barcode.gs128();
      case 11:
        return Barcode.isbn();
      case 12:
        return Barcode.itf();
      case 13:
        return Barcode.itf14();
      case 14:
        return Barcode.itf16();
      case 15:
        return Barcode.pdf417();
      case 16:
        return Barcode.postnet();
      case 17:
        return Barcode.qrCode();
      case 18:
        return Barcode.rm4scc();
      case 19:
        return Barcode.telepen();
      case 20:
        return Barcode.upcA();
      case 21:
        return Barcode.upcE();
      default:
        return Barcode.qrCode();
    }
  }
}

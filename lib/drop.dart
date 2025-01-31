import 'package:flutter/material.dart';
import 'package:qrcode/home_page.dart';

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // Lista de strings para o dropdown
  final List<String> _items = [
    'aztec',
    'codabar',
    'code128',
    'code39',
    'code93',
    'dataMatrix',
    'ean13',
    'ean2',
    'ean5',
    'ean8',
    'gs128',
    'isbn',
    'itf',
    'itf14',
    'itf16',
    'pdf417',
    'postnet',
    'qrCode',
    'rm4scc',
    'telepen',
    'upcA',
    'upcE'
  ];

  // Variável para armazenar o valor selecionado
  String _selectedItem = 'qrCode';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // DropdownButton
          DropdownButton<String>(
            hint: const Text('Selecione um tipo'),
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue ?? ''; // Atualiza o valor selecionado
              });
            },
            items: _items.map<DropdownMenuItem<String>>((String value) {
              setState(() {
                Home.posicaoTipoScan = _items.indexOf(_selectedItem);
              });

              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          // Exibe o valor selecionado
          /*  Text(
            _selectedItem != null
                ? 'Selecionado: $_selectedItem ${Home.posicaoTipoScan}'
                : 'Nenhum item selecionado',
            style: TextStyle(fontSize: 20),
          ), */
        ],
      ),
    );
  }
}

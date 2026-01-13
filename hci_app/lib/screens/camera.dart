import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skann QR-kode')),
      body: MobileScanner(
        // Denne funksjonen kjører hver gang kameraet ser en QR-kode
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            if (barcode.rawValue != null) {
              // Returner koden til forrige skjerm
              Navigator.pop(context, barcode.rawValue);
              break; 
            }
          }
        },
      ),
    );
  }
}
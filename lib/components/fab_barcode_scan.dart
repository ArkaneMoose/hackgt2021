import 'package:flutter/cupertino.dart';
import 'package:hackgt2021/models/scan_result.dart';
import 'package:hackgt2021/screens/scan_barcode/scan_barcode_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';

class FabBarcodeScan extends StatelessWidget {
  final Function(Future<ScanResult?>)? onBarcodeScan;
  final Function(ScanResult)? onBarcodeScanned;
  const FabBarcodeScan({this.onBarcodeScan, this.onBarcodeScanned, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: FloatingActionButton(
          tooltip: 'Scan barcode',
          child: const Icon(Ionicons.barcode_outline, size: 30.0),
          onPressed: () {
            _scanBarcode(context);
          },
        ),
        width: 64,
        height: 64);
  }

  Future<void> _scanBarcode(BuildContext context) async {
    // final Future<ScanResult> scan = BarcodeScanner.scan(
    //   options: const ScanOptions(
    //     restrictFormat: [
    //       BarcodeFormat.ean13,
    //       BarcodeFormat.ean8,
    //       BarcodeFormat.upce
    //     ],
    //   ),
    // );
    final Future<ScanResult?> scan = Navigator.push<ScanResult?>(
      context,
      CupertinoPageRoute(
        builder: (context) => const ScanBarcodeScreen(),
      ),
    );
    if (onBarcodeScan != null) {
      onBarcodeScan!(scan);
    }
    final ScanResult? result = await scan;
    if (result != null &&
        onBarcodeScanned != null &&
        result.type == ResultType.barcode) {
      onBarcodeScanned!(result);
    }
  }
}

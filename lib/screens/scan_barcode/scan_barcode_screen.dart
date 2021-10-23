import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ScanBarcodeScreen extends StatefulWidget {
  const ScanBarcodeScreen({Key? key}) : super(key: key);

  @override
  _ScanBarcodeScreenState createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  void _initCamera() async {
    _cameras = await availableCameras();
    if (!mounted) {
      return;
    }

    var camera = _cameras?.first;
    if (camera == null) {
      Navigator.of(context).pop(null);
      return;
    }

    _controller = CameraController(
      camera,
      ResolutionPreset.high,
    );
    try {
      await _controller!.initialize();
    } on CameraException catch (e) {
      print(e);
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop(null);
      return;
    }

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  void _detectBarcode() async {
    while (true) {
      // if (!(_controller?.value.isInitialized ?? false)) {
      //   return;
      // }
      // final WriteBuffer allBytes = WriteBuffer();
      // for
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!(_controller?.value.isInitialized ?? false)) {
      return Container();
    }
    return CameraPreview(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

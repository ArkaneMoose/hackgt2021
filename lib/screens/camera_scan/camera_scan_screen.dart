import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:retail_io/components/coin_icon.dart';
import 'package:retail_io/constants.dart';
import 'package:retail_io/models/coins.dart';
import 'package:retail_io/models/task.dart';
import 'package:provider/provider.dart';

enum _ScavengerHuntStep { step1, step2, complete }

class CameraScanScreen extends StatefulWidget {
  final ScanTask task;

  const CameraScanScreen({required this.task, Key? key}) : super(key: key);

  @override
  _CameraScanScreenState createState() => _CameraScanScreenState();
}

class _CameraScanScreenState extends State<CameraScanScreen>
    with WidgetsBindingObserver {
  final _barcodeScanner = GoogleMlKit.vision.barcodeScanner([
    BarcodeFormat.upca,
    BarcodeFormat.upce,
  ]);
  CameraController? _controller;
  bool _isDetecting = false;
  _ScavengerHuntStep _step = _ScavengerHuntStep.step1;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  void _initCamera() async {
    List<CameraDescription> cameras = [];
    try {
      cameras = await availableCameras();
    } on CameraException catch (_) {}
    if (!mounted) {
      return;
    }

    final CameraDescription? camera = cameras.first;
    if (camera == null) {
      Navigator.of(context).pop(null);
      return;
    }

    _onNewCameraSelected(camera);
  }

  void _onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller!.dispose();
    }

    final cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _controller = cameraController;

    cameraController.addListener(() {
      if (mounted) {
        if (cameraController.value.hasError) {
          Navigator.of(context).pop(null);
        } else {
          setState(() {});
        }
      }
    });

    try {
      await cameraController.initialize();
      await cameraController.startImageStream(
          (image) => _detectBarcode(cameraDescription, image));
    } on CameraException catch (_) {}
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!(_controller?.value.isInitialized ?? false)) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_controller != null) {
        _onNewCameraSelected(_controller!.description);
      }
    }
  }

  void _detectBarcode(CameraDescription camera, CameraImage image) async {
    if (_isDetecting || _step != _ScavengerHuntStep.step1) {
      return;
    }
    _isDetecting = true;
    final inputImage =
        _getInputImageFromCameraImage(camera: camera, image: image);
    final barcodes = await _barcodeScanner.processImage(inputImage);
    if (barcodes.any((element) => element.value.rawValue == widget.task.upc) &&
        mounted) {
      setState(() {
        _step = _ScavengerHuntStep.step2;
      });
    }
    _isDetecting = false;
  }

  @override
  Widget build(BuildContext context) {
    Widget cameraPreview = !(_controller?.value.isInitialized ?? false)
        ? const CircularProgressIndicator()
        : AspectRatio(
            aspectRatio: 1.0 / _controller!.value.aspectRatio,
            child: CameraPreview(_controller!),
          );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Scavenger Hunt"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            child: cameraPreview,
          )),
          Expanded(
              flex: 2,
              child: ListView(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  children: [
                    RichText(
                      text: TextSpan(
                        children: widget.task.taskText,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Reward:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: " "),
                          const WidgetSpan(child: CoinIcon(size: 20)),
                          TextSpan(text: " ${widget.task.reward}"),
                        ],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: _step == _ScavengerHuntStep.step1
                                ? Container(
                                    padding: const EdgeInsets.all(2.0),
                                    child: const CircularProgressIndicator(),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                          const Text(
                            "Find the item and scan its barcode",
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(kDefaultPadding / 2),
                            child: _step == _ScavengerHuntStep.step1
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                                : _step == _ScavengerHuntStep.step2
                                    ? Container(
                                        padding: const EdgeInsets.all(2.0),
                                        child:
                                            const CircularProgressIndicator(),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                          ),
                          const Text(
                              "Take a picture of the item and its surroundings on the shelf"),
                        ]),
                        TableRow(children: [
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(kDefaultPadding / 2),
                            child: _step != _ScavengerHuntStep.complete
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.all(2.0),
                                    child: const CircularProgressIndicator(),
                                  ),
                          ),
                          const Text("Receive your reward!"),
                        ]),
                      ],
                    ),
                  ])),
        ],
      ),
      floatingActionButton: _step == _ScavengerHuntStep.step2
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: FloatingActionButton.large(
                onPressed: () {
                  setState(() {
                    _step = _ScavengerHuntStep.complete;
                    Provider.of<CoinsModel>(context, listen: false)
                        .addCoins(widget.task.reward);
                    Navigator.pop(context);
                  });
                },
                child: const Icon(Icons.camera_alt),
              ))
          : null,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

InputImage _getInputImageFromCameraImage(
    {required CameraDescription camera, required CameraImage image}) {
  final WriteBuffer allBytes = WriteBuffer();
  for (Plane plane in image.planes) {
    allBytes.putUint8List(plane.bytes);
  }
  final bytes = allBytes.done().buffer.asUint8List();

  final Size size = Size(image.width.toDouble(), image.height.toDouble());
  final InputImageRotation rotation =
      InputImageRotationMethods.fromRawValue(camera.sensorOrientation) ??
          InputImageRotation.Rotation_0deg;
  final InputImageFormat format =
      InputImageFormatMethods.fromRawValue(image.format.raw) ??
          InputImageFormat.NV21;
  final planeData = image.planes.map((Plane plane) {
    return InputImagePlaneMetadata(
        bytesPerRow: plane.bytesPerRow,
        height: plane.height,
        width: plane.width);
  }).toList();

  return InputImage.fromBytes(
    bytes: bytes,
    inputImageData: InputImageData(
      size: size,
      imageRotation: rotation,
      inputImageFormat: format,
      planeData: planeData,
    ),
  );
}

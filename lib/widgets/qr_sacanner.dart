//import 'dart:io';

//import 'package:flutter/material.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart';

//class QRViewExample extends StatefulWidget {
//  const QRViewExample({Key? key}) : super(key: key);

//  @override
//  State<StatefulWidget> createState() => _QRViewExampleState();
//}

//class _QRViewExampleState extends State<QRViewExample> {
//  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//  Barcode? result;
//  QRViewController? controller;

//  // In order to get hot reload to work we need to pause the camera if the platform
//  // is android, or resume the camera if the platform is iOS.
//  @override
//  void reassemble() {
//    super.reassemble();
//    if (Platform.isAndroid) {
//      controller!.pauseCamera();
//    } else if (Platform.isIOS) {
//      controller!.resumeCamera();
//    }
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        height: 100,
//        child: Column(
//          children: <Widget>[
            
//               QRView(
//                key: qrKey,
//                onQRViewCreated: _onQRViewCreated,
//              ),
           
            
            
//               Center(
//                child: (result != null)
//                    ? Text(
//                        'Barcode Type: ${result!.format}   Data: ${result!.code}')
//                    : Text('Scan a code'),
//              ),
          
//          ],
//        ),
//      ),
//    );
//  }

//  void _onQRViewCreated(QRViewController controller) {
//    this.controller = controller;
//    controller.scannedDataStream.listen((scanData) {
//      setState(() {
//        result = scanData;
//      });
//    });
//  }

//  @override
//  void dispose() {
//    controller?.dispose();
//    super.dispose();
//  }
//}
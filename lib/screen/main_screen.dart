import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saventeam/screen/web_view.dart';
//import 'package:qrscan/qrscan.dart' as scanner;

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  late TextEditingController _outputController;

  @override
  initState() {
    super.initState();

    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF556ee6),
        child: Column(children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    "assets/image/logi.png",
                    height: 150,
                    width: 150,
                  )),
                  const Text(
                    "7team",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Text(_outputController.text),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFfdb713),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _scan();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/scanner.png",
                          height: 64,
                          width: 64,
                          color: Colors.black,
                        ),
                        Text("تسجيل الدوام",
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFfdb713),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: (() => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const WebViewScreen()))
                      }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/login.png",
                          height: 64,
                          width: 64,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Text(
                          "الملف الشخصي",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future _scan() async {
    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
         try {
      var qrResult = await BarcodeScanner.scan();
    
      if (qrResult.rawContent.contains("http")) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewScreen(
                  url: qrResult.rawContent,
                )));
      }
    } on FormatException catch (ex) {
      print('Pressed the Back Button before Scanning');
    } catch (ex) {
      print('Unknown Error $ex');
    }
  
    } else {
      await Permission.camera.request();
    }
  }
}

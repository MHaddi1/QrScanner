import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/consts/color.dart';

class ResultScreen extends StatelessWidget {
  final String result;
  final Function() closeScreen;
  const ResultScreen({
    super.key,
    required this.result,
    required this.closeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              //print("back to Screen");
              closeScreen();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.black87),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: result,
              version: QrVersions.auto,
              size: 150,
            ),
            const Text(
              "Scanned Result",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.black54),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              result,
              style: const TextStyle(
                  fontSize: 16, letterSpacing: 1, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: result));
                  print("Copied");
                },
                child: const Text(
                  "Copy",
                  style:
                      TextStyle(fontSize: 16, letterSpacing: 1, color: bgColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

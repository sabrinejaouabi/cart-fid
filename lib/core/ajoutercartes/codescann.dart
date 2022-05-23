import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class codescann extends StatefulWidget {
   String? value;
  codescann({Key? key,this.value }) : super(key: key );
  //const codescann({Key? key}) : super(key: key);
  @override
  State<codescann> createState() => _codescannState();
}
class _codescannState extends State<codescann> {
  @override
  /*String _data = "";

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }
*/
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BarcodeWidget(
          barcode:Barcode.code93(),
             data:widget.value!,
             width: 150,
            // width:100,
    ),
          //Text("${widget.value}"),
        ],
      ),
    );
  }
}

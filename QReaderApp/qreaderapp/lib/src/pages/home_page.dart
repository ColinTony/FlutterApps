import 'package:flutter/material.dart';
import 'package:qreaderapp/src/pages/direcciones_page.dart';
import 'package:qreaderapp/src/pages/mapas_page.dart';
import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QrScanner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          )
        ],
      ),
      body: _callPage(_currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scamQr,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scamQr() async {
    ScanResult futureString;
    var options = ScanOptions(strings: {
      "cancel": _cancelController.text,
      "flash_on": _flashOffController.text,
      "flash_off": _flashOffController.text
    });
    try {
      futureString = await BarcodeScanner.scan(options: options);
    } catch (e) {
      print(e.toString());
    }
    // geo:40.7356804248455,-74.2847193761719

    print("Future string => ${futureString.rawContent}");
    if (futureString != null) print("Tenemos info");
  }

  Widget _callPage(int index) {
    switch (index) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }

  Widget _crearBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: this._currentIndex,
      onTap: (index) {
        setState(() {
          this._currentIndex = index;
        });
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text("Mapas")),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text("Direcciones")),
      ],
    );
  }
}

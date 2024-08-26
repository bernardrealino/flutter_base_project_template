import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  BluetoothPageState createState() => BluetoothPageState();
}

class BluetoothPageState extends State<BluetoothPage> {
  String _data = '';
  bool _scanning = false;
  final FlutterScanBluetooth _bluetooth = FlutterScanBluetooth();

  @override
  void initState() {
    super.initState();

    _bluetooth.devices.listen((device) {
      setState(() {
        _data += '${device.name} (${device.address})\n';
      });
    });
    _bluetooth.scanStopped.listen((device) {
      setState(() {
        _scanning = false;
        _data += 'scan stopped\n';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_data),
                  onTap: () {
                    // Open the message or perform an action
                    print(_data);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                  child: Text(_scanning ? 'Stop scan' : 'Start scan'),
                  onPressed: () async {
                    try {
                      if (_scanning) {
                        await _bluetooth.stopScan();
                        debugPrint("scanning stoped");
                        setState(() {
                          _data = '';
                        });
                      } else {
                        await _bluetooth.startScan(pairedDevices: false);
                        debugPrint("scanning started");
                        setState(() {
                          _scanning = true;
                        });
                      }
                    } on PlatformException catch (e) {
                      debugPrint(e.toString());
                    }
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                  child: const Text('Check permissions'),
                  onPressed: () async {
                    try {
                      await _bluetooth.requestPermissions();
                      print('All good with perms');
                    } on PlatformException catch (e) {
                      debugPrint(e.toString());
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}

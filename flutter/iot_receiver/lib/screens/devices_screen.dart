import 'dart:io';

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:iot_receiver/widgets/new_device_dialog.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({Key? key}) : super(key: key);
  static const String id = '/devices_screen';
  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    // * Getting the AtClientManager instance to use below
    //AtClientManager atClientManager = AtClientManager.getInstance();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    // var mediaQuery = MediaQuery.of(context);
    // var _width = mediaQuery.size.width * mediaQuery.devicePixelRatio;
    // var _height = mediaQuery.size.height * mediaQuery.devicePixelRatio;

    int _gridRows = 1;
    if (_width > _height) {
      _gridRows = 2;
    } else {
      _gridRows = 1;
    }
    return Scaffold(
      appBar: NewGradientAppBar(
        title: const AutoSizeText(
          'Devices',
          minFontSize: 5,
          maxFontSize: 50,
        ),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 173, 83, 78),
          Color.fromARGB(255, 108, 169, 197)
        ]),
        actions: [
          PopupMenuButton<String>(
            color: const Color.fromARGB(255, 108, 169, 197),
            //padding: const EdgeInsets.symmetric(horizontal: 10),
            icon: const Icon(
              Icons.menu,
              size: 20,
            ),
            onSelected: (String result) {
              switch (result) {
                case 'CLOSE':
                  exit(0);
                case 'NEW DEVICE':
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                height: 20,
                value: 'CLOSE',
                child: Text(
                  'CLOSE',
                  style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 5,
                      backgroundColor: Color.fromARGB(255, 108, 169, 197),
                      color: Colors.black),
                ),
              ),
              const PopupMenuItem<String>(
                height: 20,
                value: 'NEW DEVICE',
                child: Text(
                  'NEW DEVICE',
                  style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 5,
                      backgroundColor: Color.fromARGB(255, 108, 169, 197),
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          gradient: _gridRows > 1
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 240, 181, 178),
                    Color.fromARGB(255, 171, 200, 224)
                  ],
                )
              : const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 240, 181, 178),
                    Color.fromARGB(255, 171, 200, 224)
                  ],
                ),
          image: const DecorationImage(
            opacity: .15,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            image: AssetImage(
              'assets/images/blood-pressure.png',
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          var newDevice = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewHrO2Device()),
          );
          if (newDevice == null) {
          } else {
            setState(() {
              // devices.add(newDevice);
              // saveDevices(devices);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
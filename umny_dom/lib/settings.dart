import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController passwordController = TextEditingController();
  String? selectedNetworkIP;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  void requestPermissions() async {
    if (await Permission.location.request().isGranted) {
      getCurrentNetworkIP();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Необходимо разрешение на доступ к местоположению.')),
      );
    }
  }

  void getCurrentNetworkIP() async {
    String? ip = await WiFiForIoTPlugin.getIP();
    setState(() {
      selectedNetworkIP = ip?.isNotEmpty == true ? ip : null;
    });

    if (selectedNetworkIP == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Необходимо подключиться к сети.')),
      );
    }
  }

  void connectToNetwork() async {
    bool isConnected = await WiFiForIoTPlugin.connect(
      selectedNetworkIP!,
      password: passwordController.text,
      joinOnce: true,
      security: NetworkSecurity.WPA,
    );
    if (isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Подключение успешно.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось подключиться к сети.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/sloi2.png',
                  height: 40,
                ),
              ),
              Positioned(
                left: 10,
                top: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/nazad.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/setting.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedNetworkIP ?? 'Выбрать сеть',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                width: 270,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/parol.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Пароль',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                              ),
                              Container(
                                width: 270,
                                height: 2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: selectedNetworkIP != null ? connectToNetwork : null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        ),
                      ),
                      child: Text(
                        'Сохранить',
                        style: TextStyle(
                          color: Color(0xFF4e526d),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

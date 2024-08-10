import 'package:flutter/material.dart';
import 'package:umny_dom/settings.dart';
import 'package:umny_dom/sign.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:umny_dom/save.dart';
import 'admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute: '/', // Начальный маршрут, если нужно
      routes: {
        '/': (context) => SplashScreen(), // Маршрут для SplashScreen
        '/main': (context) => MainPage(), // Маршрут для MainPage
        '/admin': (context) => AdminLoginPage(),
        '/sign': (context) => AdminPage(),
        '/sohr': (context) => SavePage(),
        '/setting': (context) => SettingsPage(),// Маршрут для AdminLoginPage
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Половина времени на появление
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacementNamed(context, '/main'); // Переход на MainPage
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.asset('assets/images/sloi2.png'),
            ),
          ),
        ),
      ),
    );
  }
}


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/sloi2.png',
                  height: 40,
                ),
              ),
              Positioned(
                right: 10,
                top: 30,
                child: IconButton(
                  icon: Image.asset('assets/images/adam.png', height: 30),
                  onPressed: () {
                    Navigator.pushNamed(context, '/admin');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 100, 10, 0), // Обновленные отступы
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: SpeedControl(
                  imagePath: 'assets/images/speed.png',
                  labelText: 'Скорость вкл./выкл',
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: SpeedControl(
                  imagePath: 'assets/images/time.png',
                  labelText: 'Время работы подсветки',
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: SpeedControl(
                  imagePath: 'assets/images/brig.png',
                  labelText: 'Яркость %',
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: ColorPickerControl(
                  label: "Цвет ленты",
                  imagePath: 'assets/images/color.png',
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: ColorPickerControl(
                  label: "Дежурная яркость",
                  imagePath: 'assets/images/brig.png',
                  isUnderText: true,
                ),
              ),
              SizedBox(height: 20),
              SliderControl(),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sohr');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                      ),
                    ),
                    child: Text(
                      'Сохранить настройки',
                      style: TextStyle(
                        color: Color(0xFF4e526d),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/setting');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                    child: Text(
                      'Выбрать настройки',
                      style: TextStyle(
                        color: Color(0xFF4e526d),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class SpeedControl extends StatefulWidget {
  final String imagePath;
  final String labelText;

  SpeedControl({required this.imagePath, required this.labelText});

  @override
  _SpeedControlState createState() => _SpeedControlState();
}

class _SpeedControlState extends State<SpeedControl> {
  double currentValue = 0.0;
  final double maxValue = 250.0;

  void updateValue(double newValue) {
    setState(() {
      if (newValue < 0) {
        currentValue = 0;
      } else if (newValue > maxValue) {
        currentValue = maxValue;
      } else {
        currentValue = newValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            // Image
            Image.asset(widget.imagePath, height: 30),
            SizedBox(width: 7),
            // Text
            Text(
              widget.labelText,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(width: 10),
            // Value and Buttons
            Spacer(),
            // Square with numbers
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xff5a749e),
                borderRadius: BorderRadius.circular(5),

              ),
              child: Center(
                child: Text(
                  '${currentValue.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(width: 2),
            Column(
              children: [
                Container(
                  height: 20,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Color(0xff5a749e),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.translate(
                      offset: Offset(0, -8), // поднять иконку выше на 5 пикселей
                      child: IconButton(
                        icon: Icon(Icons.arrow_drop_up, size: 35, color: Colors.white), // увеличен размер для увеличения ширины
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (currentValue < maxValue) {
                            updateValue(currentValue + 1);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1),
                Container(
                  height: 20,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Color(0xff5a749e),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.translate(
                      offset: Offset(0, -8), // поднять иконку выше на 5 пикселей
                      child: IconButton(
                        icon: Icon(Icons.arrow_drop_down, size: 35, color: Colors.white), // увеличен размер для увеличения ширины
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (currentValue > 0) {
                            updateValue(currentValue - 1);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
        Slider(
          min: 0,
          max: maxValue,
          value: currentValue,
          onChanged: (newValue) {
            updateValue(newValue);
          },
          onChangeEnd: (newValue) {
            updateValue(newValue);
          },
          activeColor: Color(0xFF9089AA),
          inactiveColor: Colors.white,
          divisions: maxValue.toInt(),
          label: currentValue.round().toString(),
        ),
      ],
    );
  }
}

class ColorPickerControl extends StatefulWidget {
  final String label;
  final String imagePath;
  final bool isUnderText;

  ColorPickerControl({
    required this.label,
    required this.imagePath,
    this.isUnderText = false,
  });

  @override
  _ColorPickerControlState createState() => _ColorPickerControlState();
}

class _ColorPickerControlState extends State<ColorPickerControl> {
  Color selectedColor = Colors.white;

  void showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Выберите цвет'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ок'),
              onPressed: () {
                setState(() {
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(widget.imagePath, height: 30),
            SizedBox(width: 10),
            Text(
              widget.label,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            if (!widget.isUnderText)
              Spacer(),
            if (!widget.isUnderText)
              GestureDetector(
                onTap: showColorPickerDialog,
                child: Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff5a749e), width: 3),
                  ),
                  child: Icon(Icons.arrow_drop_down, color: Colors.black),
                ),
              ),
          ],
        ),
        if (widget.isUnderText)
          GestureDetector(
            onTap: showColorPickerDialog,
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff5a749e), width: 3),
              ),
              child: Icon(Icons.arrow_drop_down, color: Colors.black),
            ),
          ),
        if (widget.isUnderText)
          SizedBox(height: 10),
      ],
    );
  }
}
class SliderControl extends StatefulWidget {
  @override
  _SliderControlState createState() => _SliderControlState();
}

class _SliderControlState extends State<SliderControl> {
  double currentValue = 0.0;
  final double maxValue = 250.0; 

  void updateValue(double newValue) {
    setState(() {
      if (newValue < 0) {
        currentValue = 0;
      } else if (newValue > maxValue) {
        currentValue = maxValue;
      } else {
        currentValue = newValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Spacer(),
            // Square with numbers
            Transform.translate(
              offset: Offset(0, -60), 
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0xff5a749e),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '${currentValue.toInt()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 2),
            Column(
              children: [
                Transform.translate(
                  offset: Offset(0, -60), 
                  child: Container(
                    height: 20,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color(0xff5a749e),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(0, -5), 
                        child: IconButton(
                          icon: Icon(Icons.arrow_drop_up, size: 35, color: Colors.white),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (currentValue < maxValue) {
                              updateValue(currentValue + 1);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1),
                Transform.translate(
                  offset: Offset(0, -60), 
                  child: Container(
                    height: 20,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color(0xff5a749e),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(0, -5), // Смещение для значка треугольника
                        child: IconButton(
                          icon: Icon(Icons.arrow_drop_down, size: 35, color: Colors.white),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (currentValue > 0) {
                              updateValue(currentValue - 1);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 0),
        Transform.translate(
          offset: Offset(0, -50), // Скорректированное смещение ползунка
          child: Slider(
            min: 0,
            max: maxValue,
            value: currentValue,
            onChanged: (newValue) {
              updateValue(newValue);
            },
            onChangeEnd: (newValue) {
              updateValue(newValue);
            },
            activeColor: Color(0xFF9089AA),
            inactiveColor: Colors.white,
            divisions: maxValue.toInt(),
            label: currentValue.round().toString(),
          ),
        ),
      ],
    );
  }
}

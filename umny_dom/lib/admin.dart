import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false, // Remove default back button
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 100, 10, 100), // Adjusted padding
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: SpeedControl(
                imagePath: 'assets/images/stupen.png',
                labelText: 'Количество лент',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: SpeedControl(
                imagePath: 'assets/images/numb.png',
                labelText: 'Номер контроллера',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: SpeedControl(
                imagePath: 'assets/images/photo.png',
                labelText: 'Порог фотодатчика',
              ),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/lenta.png', height: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Тип ленты',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    // Radio buttons for Type of Tape
                    Row(
                      children: [
                        RadioWidget(title: 'Monochrom'),
                        SizedBox(width: 20),
                        RadioWidget(title: 'RGBW'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        RadioWidget(title: 'RGB'),
                        SizedBox(width: 20),
                        RadioWidget(title: 'Адресная'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/senser.png', height: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Тип сенсора1',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    // Radio buttons for Type of Sensor1
                    Row(
                      children: [
                        RadioWidget(title: 'внутренний'),
                        SizedBox(width: 20),
                        RadioWidget(title: 'внешний'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/senser2.png', height: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Тип сенсора2',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    // Radio buttons for Type of Sensor2
                    Row(
                      children: [
                        RadioWidget(title: 'внутренний'),
                        SizedBox(width: 20),
                        RadioWidget(title: 'внешний'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/demo.png', height: 30),
                SizedBox(width: 10),
                Text(
                  'DEMO режим',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Spacer(),
                Switch(
                  value: true, // Пример значения
                  onChanged: (bool newValue) {
                    // Обработка изменения состояния
                  },
                  activeColor: Color(0xFF332b51),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/setting.png', height: 30),
                SizedBox(width: 10),
                Text(
                  'Настройки Wifi',
                  style: TextStyle(color: Colors.white, fontSize: 17),
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

class RadioWidget extends StatefulWidget {
  final String title;

  RadioWidget({required this.title});

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            width: 20,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Color(0xFF332b51) : Colors.white,
              border: Border.all(color: Colors.white, width: 3),
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

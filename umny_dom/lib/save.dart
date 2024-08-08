import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

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
                    fit: BoxFit.contain, // Adjust the fit as needed
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background Image
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Centered with Padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200), // Space to push content up
                  // Row with Image and Text Field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/name.png',
                        width: 45,
                        height: 40,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 270,
                              child: TextField(
                                controller: textController,
                                decoration: InputDecoration(
                                  hintText: 'Название',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                              ),
                            ),
                            // White Bottom Border
                            Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Save Settings Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press action here
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
                      'Сохранить настройки',
                      style: TextStyle(
                        color: Color(0xFF4e526d),
                        fontSize: 18,
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

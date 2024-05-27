import 'package:flutter/material.dart';
import 'package:one8/Unit/One8.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "One8",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(250),
                  ),
                  color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                  ),
                  color: Colors.white),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.all(3),
                      textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const One8(),
                          settings: const RouteSettings(
                            arguments: "https://www.one8.com/",
                          ),
                        ),
                      );
                    },
                    child: Image(image: AssetImage("asstes/images/one8.jpg"),height: 250,width: 250,fit: BoxFit.fill,)
                ),


              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(250),
                  ),
                  color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(250),
                  ),
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

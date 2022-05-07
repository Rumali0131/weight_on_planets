import 'package:flutter/material.dart';
import 'package:weight_on_planets/ui/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 150.0,
            image: AssetImage("assets/planet.jpg"),
            fit: BoxFit.cover
          )
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Weight on Planets',
                style: TextStyle(
                    fontSize:45.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black87
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const HomePage()))
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(color: Colors.black87)
                      ),
                      minimumSize: const Size(150, 50),
                      textStyle: const TextStyle(fontSize: 28),
                      primary: Colors.black87,
                      onPrimary: Colors.white,
                    ),
                    child: const Text('Go!')
                )
            )
          ],
        ),
      ),
    );
  }
}
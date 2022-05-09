
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final TextEditingController _weightController = TextEditingController();

var selected = 'Venus';
final dropDownList = <String> ['Venus','Mars','Mercury','Jupiter','Saturn','Neptune','Uranus'];
double _finalResult = 0.0;
String _planetName = "";

void handleValue(String? val) {
  setState(() {
    if(val != null) {
      selected = val;
      switch (val) {
        case "Venus":
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _planetName = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        case "Mars":
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _planetName = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case "Mercury":
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _planetName = "Your weight on Mercury is ${_finalResult.toStringAsFixed(1)}";
          break;
        case "Jupiter":
          _finalResult = calculateWeight(_weightController.text, 2.34);
          _planetName = "Your weight on Jupiter is ${_finalResult.toStringAsFixed(1)}";
          break;
        case "Saturn":
          _finalResult = calculateWeight(_weightController.text, 1.06);
          _planetName = "Your weight on Saturn is ${_finalResult.toStringAsFixed(1)}";
          break;
        case "Uranus":
          _finalResult = calculateWeight(_weightController.text, 0.92);
          _planetName = "Your weight on Uranus is ${_finalResult.toStringAsFixed(1)}";
          break;
        case "Neptune":
          _finalResult = calculateWeight(_weightController.text, 1.19);
          _planetName = "Your weight on Neptune is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Weight on Planet', style: TextStyle(fontSize: 25.0, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: 'Your weight on Earth',
                  hintText: 'In kilograms',
                  hintStyle: TextStyle(fontSize: 13.0, color: Colors.grey, fontWeight: FontWeight.normal),
                  labelStyle: TextStyle(fontSize: 18.0, color: Colors.black,fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.arrow_right_outlined, size: 40.0,)
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(4.0)
              ),
              child: DropdownButton(
                  value: selected,
                  underline: DropdownButtonHideUnderline(child: Container(),),
                  items: dropDownList.map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: const TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.bold),))).toList(),
                  onChanged: handleValue
              ),
            ),
            Container(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  _weightController.text.isEmpty ? "Please enter weight" : _planetName +" kg",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )
            )
          ],
        ),
      ),
    );
  }
double calculateWeight(String weight, double multiplier) {
  if(int.parse(weight).toString().isNotEmpty &&  int.parse(weight) > 0){
    return int.parse(weight) * multiplier;
  } else {
    return int.parse("0")*1; // give a default weight! Be creative!
  }
}
}

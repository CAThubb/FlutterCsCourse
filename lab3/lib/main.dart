import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyCustomWidget(),
    ),
  );
}

class AccelerationCalculator {
  late double initialVelocity;
  late double finalVelocity;
  late double time;
  late double acceleration;

  AccelerationCalculator({required this.initialVelocity, required this.finalVelocity, required this.time});

  double calculateAcceleration() {
    acceleration = (finalVelocity - initialVelocity) / time;
    return acceleration;
  }
}

class ResultScreen extends StatelessWidget {
  late final double acceleration;
  ResultScreen({required this.acceleration});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remizov Dmitry Sergeyevich"),
        backgroundColor: Color(0xFF80CBC4),
        foregroundColor: Color(0xFFFF9800),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ускорение при равноускоренном движении: ${acceleration.toStringAsFixed(3)} м/с^2"),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Закрыть"))
          ],
        ),
      )
    );

  }
}

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  final _initialVelocity = TextEditingController();
  final _finalvelocity = TextEditingController();
  final _time = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _agreement = false;
  bool _showConsentError = false;

  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return "Введите значение";
    }

    if (double.tryParse(value) == null) {
      return "Введите число";
    }

    double doubleValue = double.parse(value);
    if (doubleValue < 0) {
      return "Только положительные числа";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Remizov Dmitry Sergeyevich"),
       backgroundColor: Color(0xFF80CBC4),
       foregroundColor: Color(0xFFFF9800),
     ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Начальная скорость м/с",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 0.9,
                        )
                    )
                ),
                controller: _initialVelocity,
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: validateInput,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Конечная скорость м/с",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 0.9,
                        )
                    )
                ),
                controller: _finalvelocity,
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: validateInput,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Время сек",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 0.9,
                        )
                    )
                ),
                controller: _time,
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: validateInput,
              ),
              CheckboxListTile(
                  value: _agreement,
                  title: new Text('Я ознакомлен с документом "Согласие на обработку персональный данных" и даю согласие на обработку моих персональных данных '),
                  onChanged: (bool? value) => setState(() => _agreement = value!)),
              if(_showConsentError)
                Text("Пожалуйста согласитесь на обработку данных",
                  style: TextStyle(color: Colors.red),),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showConsentError = !_agreement;
                    });
                    if(_formKey.currentState!.validate() &&_agreement) {
                      final initialVelocity = double.parse(_initialVelocity.text);
                      final finalVelocity = double.parse(_finalvelocity.text);
                      final time = double.parse(_time.text);

                      final calculator = AccelerationCalculator(
                        initialVelocity: initialVelocity,
                        finalVelocity: finalVelocity,
                        time: time,
                      );

                      calculator.calculateAcceleration();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(acceleration: calculator.acceleration)));
                    }
                  },
                  child: const Text("Посчитать!"))
            ],
          ),
        ),
      ),
    );
  }
}


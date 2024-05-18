import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageStateful(title: 'Counter 2.0'),
    );
  }
}

class HomePageStateful extends StatefulWidget {
  final String title;

  const HomePageStateful({required this.title, super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  int _counter = 0;
  int _incCounter = 0;
  int _decCounter = 0;
  bool _hasError = false;

  void _incrementCounter() {
    print('new value: $_counter');
    setState(() {
      _counter += 1;
      _incCounter += 1;
      if (_counter > 0) {
        _hasError = false;
      }
    });
  }

  void _decrementCounter() {
    print('new value: $_counter');
    setState(() {
      if (_counter - 1 >= 0) {
        _hasError = false;
        _counter -= 1;
      } else {
        _hasError = true;
      }
      _decCounter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build() method called');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your calculated sum is:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(' Increment button times:'),
                Text('$_incCounter',
                    style: Theme.of(context).textTheme.bodyMedium),
                const Text(' Decrement button times:'),
                Text(
                  '$_decCounter',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment'),
                ),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('Decrement'),
                ),
              ],
            ),
            Column(
              children: [
                Text(_hasError ? 'Нельзя вычитать из нуля!' : '',
                    style: const TextStyle(color: Colors.red, fontSize: 25)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
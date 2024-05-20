import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MySuperPuperWidget(),
    );
  }
}

class MySuperPuperWidget extends StatefulWidget {
  const MySuperPuperWidget({super.key});

  @override
  State<MySuperPuperWidget> createState() => _MySuperPuperWidgetState();
}

class _MySuperPuperWidgetState extends State<MySuperPuperWidget> {
  final List<double> values = [0, 1, 2];
  int currentIndex = 0;

  double xCoordinate = 0.0;
  double yCoordinate = 0.0;
  double _rotation = 0.0;

  double tappedSizeFlag = 0.0;

  @override
  void initState() {
    super.initState();
    tappedSizeFlag = getNextValue();
  }

  double getNextValue() {
    double value = values[currentIndex];
    currentIndex = (currentIndex + 1) % values.length;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            left: xCoordinate,
            top: yCoordinate,
            child: Center(
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(_rotation),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 150 + 100 * tappedSizeFlag,
                  height: 150 + 100 * tappedSizeFlag,
                  child: Image.network(
                    'https://avatars.dzeninfra.ru/get-zen_doc/3994559/pub_6235c0593c14f46c082a5b43_6235c1ca988a6a0fb9feac2b/scale_1200',
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  tappedSizeFlag = getNextValue();
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  xCoordinate += details.delta.dx;
                  yCoordinate += details.delta.dy;
                });
              },
              onLongPress: () {
                setState(() {
                  _rotation += 0.4;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

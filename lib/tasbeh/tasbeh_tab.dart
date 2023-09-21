import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double _rotationAngle = 0.0;
  int _tapCount = 0;
  int _textIndex = 0;
  bool _showText = false;

  List<String> indicatorTexts = [
    'الله اكبر',
    'سبحان الله',
    'لا اله الا الله',
    'الحمد لله',
  ];

  void _handleBodyTap() {
    setState(() {
      _tapCount++;
      _rotationAngle += (10 / 100);

      if (_tapCount % 34 == 0) {
        _tapCount = 0;
        if (_textIndex < indicatorTexts.length - 1) {
          _textIndex++;
        } else {
          _textIndex = 0;
        }
      }
      _showText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Transform.translate(
                offset: Offset(4, 25),
                child: Image.asset('assets/images/head_of_seb7a.png'),
              ),
            ),
          ),
          InkWell(
            onTap: _handleBodyTap,
            child: Transform.rotate(
              angle: _rotationAngle,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/body_of_seb7a.png'),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            child: Text(
              'Number of Tasbeeh',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 40),
          Stack(
            children: [
              Center(
                child: Text(
                  '$_tapCount',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned.fill(
                child: Transform.scale(
                  scale: 2,
                  child: Image.asset('assets/images/rectangle.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 45),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/indicator.png'),
              if (_showText)
                Text(
                  indicatorTexts[_textIndex],
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

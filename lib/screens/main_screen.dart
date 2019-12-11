import 'game_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Color Challenge Game',
            textAlign: TextAlign.center,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3),
                child: RaisedButton(
                  color: Colors.blue[200],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GameScreen(
                                  second: 31,
                                )));
                  },
                  child: Text('30 s'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3),
                child: RaisedButton(
                  color: Colors.blue[200],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GameScreen(
                                  second: 61,
                                )));
                  },
                  child: Text('60 s'),
                ),
              ),
            ],
          ),
          Text(
            'Highest Score',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  late String message;
  late List<String> gameState;

  //initState
  void initState() {
    super.initState();
    message = " ";
    setState(() {
      this.gameState = [
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty"
      ];
    });
  }

  //resetGame
  resetGame() {
    setState(() {
      this.gameState = [
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty",
        "Empty"
      ];
    });
  }

  //PlayGame
  playGame(int index) {
    if (this.gameState[index] == "Empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = 'cross';
        } else {
          this.gameState[index] = 'circle';
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  //getImage
  AssetImage getImage(String value) {
    switch (value) {
      case ('Empty'):
        return edit;
      case ('cross'):
        return cross;
      case ('circle'):
        return circle;
    }
    return edit;
  }

  //checkWin
  checkWin() {
    if ((gameState[0] != 'Empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[0]} wins';
      });
    } else if ((gameState[3] != 'Empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[3]} wins';
      });
    } else if ((gameState[6] != 'Empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[6]} wins';
      });
    } else if ((gameState[0] != 'Empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[0]} wins';
      });
    } else if ((gameState[1] != 'Empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[1]} wins';
      });
    } else if ((gameState[2] != 'Empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[2]} wins';
      });
    } else if ((gameState[0] != 'Empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[0]} wins';
      });
    } else if ((gameState[2] != 'Empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = 'Hurray!! ${this.gameState[2]} wins';
      });
    } else if (gameState.contains('Empty')) {
      setState(() {
        this.message = 'Game Draw';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.gameState[i]),
                    ),
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            color: Colors.purple,
            minWidth: 300.0,
            height: 50.0,
            child: Text(
              "Reset Game",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              this.resetGame();
            },
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Made By Anubhav Singh Chandel",
              style: TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}

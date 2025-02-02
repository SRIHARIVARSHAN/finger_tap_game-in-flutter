import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 125,
                minWidth: 125,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => secondpage()));
                },
                child: Text("START"),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 125,
                minWidth: 125,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => secondpage()));
                },
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class secondpage extends StatefulWidget {
  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  double bch = 0;
  double rch = 0;
  bool init = false;
  int playerA = 0;
  int playerB = 0;
  @override
  Widget build(BuildContext context) {
    if (init == false) {
      bch = MediaQuery.of(context).size.height / 2;
      rch = MediaQuery.of(context).size.height / 2;
    }
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                bch = bch + 20;
                rch = rch - 20;
                init = true;
                playerA = playerA + 5;
              });
              double scr_height = MediaQuery.of(context).size.height;
              double max_height = MediaQuery.of(context).size.height - 60;

              print(scr_height);
              print(max_height);
              if (bch > max_height) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => result(playerA, "A")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              height: bch,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Player A",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                  Text(
                    playerA.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                rch = rch + 20;
                bch = bch - 20;
                playerB = playerB + 5;
                init = true;
              });
              double scr_height = MediaQuery.of(context).size.height;
              double max_height = MediaQuery.of(context).size.height - 60;

              print(scr_height);
              print(max_height);
              if (rch > max_height) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => result(playerB, "B")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              color: Colors.red,
              height: rch,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Player B",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                  Text(
                    playerB.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

class result extends StatelessWidget {
  int score = 0;
  String player = "";
  result(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: player == "A" ? Colors.blue : Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Score: ${score.toString()}",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            Text(
              "Player ${player} won!!",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            MaterialButton(
                child: Text("Restart"),
                color: const Color.fromARGB(255, 201, 238, 146),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

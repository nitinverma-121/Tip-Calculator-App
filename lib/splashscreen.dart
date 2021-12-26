import 'package:flutter/material.dart';
import 'package:tip_calculator/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        body: Center(
          child: Card(
            color: Colors.purple[50],
            elevation: 10.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  thickness: 2,
                ),
                Text(
                  "TIP-CAL",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your Pocket Tip Calculator",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                InkWell(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "click to proceed",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.forward)
                      ]),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Image(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1523540939399-141cbff6a8d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")),
                SizedBox(
                  height: 60,
                ),
                TextButton(
                    onPressed: () {
                      final _mysnackbar = SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nitin Verma",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.email),
                                  Text("@nitinverma03241",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          ),
                          backgroundColor: Colors.purple);
                      ScaffoldMessenger.of(context).showSnackBar(_mysnackbar);
                    },
                    child: Container(
                        color: Colors.purple[100],
                        child: ListTile(
                          dense: true,
                          leading: Text(
                            "FIND THE DEVELOPER",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          title: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        )))
              ],
            ),
          ),
        ));
  }
}

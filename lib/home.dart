import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _tippercentage = 0.00;
  double _billamount = 0.00;
  int _totalpersonsplit = 1;

  String _calculatetip(
      double _tippercentage, double _billamount, int _totalpersonsplit) {
    double totaltip = 0.0;

    totaltip = _billamount * _tippercentage / 100;
    return totaltip.toStringAsFixed(2);
  }

  String splittip(
      double _tippercentage, double _billamount, int _totalpersonsplit) {
    double individualbill = 0.0;
    individualbill = ((_billamount * _tippercentage) / (100) + _billamount) /
        _totalpersonsplit;

    return individualbill.toStringAsFixed(2);
  }

  String totalBill(
      double _tippercentage, double _billamount, int _totalpersonsplit) {
    double total = 0.0;
    total = ((_billamount * _tippercentage) / (100) + _billamount);

    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Caltip Tip Calculator"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Bill",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      Text(
                        totalBill(
                            _tippercentage, _billamount, _totalpersonsplit),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontSize: 45),
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      Text(
                        "Bill Per Person",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      Text(
                        splittip(
                            _tippercentage, _billamount, _totalpersonsplit),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontSize: 45),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2.0,
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Column(
                      children: [
                        TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                              hintText: "    BILL AMOUNT",
                              hintStyle: TextStyle(color: Colors.grey)),
                          onChanged: (String value) {
                            try {
                              _billamount = double.parse(value);
                            } catch (exception) {
                              _billamount = 0.0;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    SPLIT",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16.5),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  child: Container(
                                    height: 26,
                                    width: 26,
                                    child: Center(
                                        child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w900),
                                    )),
                                    decoration: BoxDecoration(
                                        color: Colors.purple.shade100),
                                  ),
                                  onTap: () => {
                                    setState(() {
                                      if (_totalpersonsplit <= 1) {
                                        _totalpersonsplit = 1;
                                      } else {
                                        _totalpersonsplit--;
                                      }
                                    })
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Text(
                                    "$_totalpersonsplit",
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    height: 26,
                                    width: 26,
                                    child: Center(
                                        child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    decoration: BoxDecoration(
                                        color: Colors.purple.shade100),
                                  ),
                                  onTap: () => {
                                    setState(() {
                                      _totalpersonsplit++;
                                    })
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "    TIP",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16.5),
                            ),
                            Text(
                              _calculatetip(_tippercentage, _billamount,
                                  _totalpersonsplit),
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          _tippercentage.toString(),
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Slider(
                            value: _tippercentage,
                            activeColor: Colors.purple.shade100,
                            divisions: 10,
                            max: 100,
                            min: 0,
                            onChanged: (value) {
                              setState(() {
                                _tippercentage = value;
                              });
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

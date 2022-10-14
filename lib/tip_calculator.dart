

import 'package:flutter/material.dart';

class TipCalculatorApp extends StatefulWidget {
  const TipCalculatorApp({super.key});

  @override
  State<StatefulWidget> createState() => TipCalculatorAppState();
}

class TipCalculatorAppState extends State<TipCalculatorApp> {
  var amtController = TextEditingController();
  var customTipController = TextEditingController();
  var _totalAmt = 0.0;
  var _tip = 0.0;
  var _perPersonAmt = 0.0;
  var personCount = 1;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("TIP CALCULATOR"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              child: Center(
                child: Image.asset(
                  "assets/images/chefhaticon.webp",
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            RichText(
              text: TextSpan(style: TextStyle(fontSize: 21), children: [
                TextSpan(
                    text: "Mr",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                TextSpan(
                    text: "TIP",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: 'Calculator',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ))
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Per Person:${_perPersonAmt.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*  const Divider(height: 2),*/
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Amt: ${_totalAmt}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              'Tip:${_tip}',
                              /*  tipTotal.toStringAsFixed(2),*/
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(8.0)),
                Column(
                  children: const [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text(
                      "Enter",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("your bill"),
                  ],
                ),
                SizedBox(width: 20),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: amtController,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.currency_rupee),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(8.0)),
                Column(
                  children: const [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text(
                      "Choose",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("your tip")
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    _tip == 10 ? Colors.green[800] : Colors.green,
                  )),
                  onPressed: () {
                    updateUI(0.1);
                  },
                  child: Text("10%"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    _tip == 10 ? Colors.green[800] : Colors.green,
                  )),
                  onPressed: () {
                    updateUI(0.15);
                  },
                  child: const Text("15%"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    _tip == 10 ? Colors.green[800] : Colors.green,
                  )),
                  onPressed: () {
                    updateUI(0.2);
                  },
                  child: const Text("20%"),
                ),
              ],
            ),
            Visibility(
              child: SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: customTipController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 10),
                  )),
                ),
              ),
              visible: isVisible,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      _tip == 10 ? Colors.green[800] : Colors.green,
                    )),
                    onPressed: () {
                      if (isVisible) {
                        var tipPercent =
                            int.parse(customTipController.text.toString());
                        updateUI(tipPercent / 100);
                      } else {
                        isVisible = true;
                      }
                      setState(() {});
                    },
                    child: Text(("Custom Tip"))),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(8.0)),
                Column(
                  children: const [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text(
                      "Split",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text("the total")
                  ],
                ),
                SizedBox(width: 30),
                Row(
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            _tip == 10 ? Colors.green[800] : Colors.green,
                          )),
                          onPressed: () {
                            if (personCount > 1) {
                              personCount--;
                              _perPersonAmt = _perPersonAmt / personCount;
                              setState(() {});
                            }
                          },
                          child: const Text("-"),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    /*  Text(split.toString()),*/
                    Text("$personCount"),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    _tip == 10 ? Colors.green[800] : Colors.green,
                  )),
                  onPressed: () {
                    setState(() {
                      personCount++;
                      _perPersonAmt = _perPersonAmt / personCount;
                    });
                  },
                  child: const Text("+"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateUI(double tipPercent) {
    var amt = int.parse(amtController.text.toString());
    var tipAmt = amt * tipPercent;
    var totalAMT = amt + tipAmt;

    _totalAmt = totalAMT;
    _tip = tipAmt;
    _perPersonAmt = _totalAmt / personCount;
    setState(() {});
  }
}

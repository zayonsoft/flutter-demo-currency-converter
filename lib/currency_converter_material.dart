import 'package:flutter/material.dart';

class CurrencyConverterMaterial extends StatefulWidget {
  const CurrencyConverterMaterial({super.key});

  @override
  State<CurrencyConverterMaterial> createState() => _CurrencyConverterState();
}

const double _conversionRate = 1300.0;

class _CurrencyConverterState extends State<CurrencyConverterMaterial> {
  double result = 0;
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 18, 52, 59),
        centerTitle: true,
      ),
      body: ColoredBox(
        color: Color.fromARGB(255, 18, 52, 59),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    "N $result",
                    style: TextStyle(
                      fontSize: 45,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(top: 25),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    controller: amountController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hint: Text(
                        "Please enter an amount in USD",
                        style: TextStyle(
                          color: Color.fromARGB(255, 161, 161, 161),
                        ),
                      ),
                      prefixIcon: Icon(Icons.monetization_on),
                      prefixIconColor: Color.fromARGB(255, 18, 52, 59),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Color.fromARGB(255, 234, 154, 204),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      final parsedAmount = double.tryParse(
                        amountController.text,
                      );
                      if (parsedAmount != null) {
                        setState(() {
                          result = parsedAmount * _conversionRate;
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    child: Text(
                      "Convert",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ColoredBox(
              color: Colors.transparent,
              child: Column(
                children: [
                  Text(
                    "Powered by ZayonSoft",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Incoming Flutter Dev..",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

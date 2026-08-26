import "package:flutter/cupertino.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() =>
      _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState
    extends State<CurrencyConverterCupertino> {
  double result = 0;
  final double _coversionRate = 1_345.27;
  TextEditingController textEditingController = TextEditingController();
  final formatter = NumberFormat("#,##0.##");

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 96, 125, 139),
        middle: Text(
          "Currency Converter (C)",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: CupertinoColors.white,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(245, 96, 125, 139),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    "\u20A6 ${formatter.format(result)}",
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text(
                    "Conversion rate: 1 USD =  \u20A6 ${formatter.format(_coversionRate)}",
                    style: GoogleFonts.inter(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: CupertinoTextField(
                controller: textEditingController,
                placeholder: "Pls, enter the amount in USD",
                placeholderStyle: GoogleFonts.inter(
                  color: CupertinoColors.inactiveGray,
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                prefix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.money_dollar_circle_fill,
                    color: Color.fromARGB(224, 7, 51, 57),
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(192, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: BoxBorder.all(
                    color: const Color.fromARGB(255, 7, 51, 57),
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CupertinoButton(
                minimumSize: Size(double.infinity, 40),
                foregroundColor: const Color.fromARGB(192, 255, 255, 255),
                color: const Color.fromARGB(255, 7, 51, 57),
                padding: const EdgeInsets.symmetric(vertical: 15),
                borderRadius: BorderRadius.circular(10),

                onPressed: () => {
                  setState(() {
                    double? userInput = double.tryParse(
                      textEditingController.text,
                    );
                    if (userInput != null) {
                      result = userInput * _coversionRate;
                    }
                  }),
                },
                child: Text(
                  "Convert",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Powered by",
                  style: GoogleFonts.lexend(
                    color: Color.fromARGB(255, 7, 51, 57),
                    fontSize: 17,
                  ),
                ),
                Text(
                  " ZayonSoft!",
                  style: GoogleFonts.lexend(
                    color: Color.fromARGB(255, 7, 51, 57),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrencyConverterMaterial extends StatefulWidget {
  const CurrencyConverterMaterial({super.key});

  @override
  State<CurrencyConverterMaterial> createState() =>
      _CurrencyConverterMaterial();
}

class _CurrencyConverterMaterial extends State<CurrencyConverterMaterial> {
  double result = 0;
  final double _coversionRate = 1_345.27;
  TextEditingController textEditingController = TextEditingController();
  final formatter = NumberFormat("#,##0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 96, 125, 139),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Currency Converter",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(245, 96, 125, 139),
      body: Center(
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
                      fontSize: 39,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Conversion rate: 1 USD =  \u20A6 ${formatter.format(_coversionRate)}",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: TextField(
                controller: textEditingController,

                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hint: Text(
                    "Pls, enter the amount in USD",
                    style: GoogleFonts.inter(color: Colors.blueGrey),
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on_sharp,
                    color: Color.fromARGB(224, 7, 51, 57),
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: const Color.fromARGB(255, 7, 51, 57),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 7, 51, 57),
                  foregroundColor: Colors.white70,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
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

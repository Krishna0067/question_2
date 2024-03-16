import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FiboSeries(),
    );
  }
}

class FiboSeries extends StatefulWidget {
  const FiboSeries({super.key});

  @override
  State<FiboSeries> createState() => _FiboSeriesState();
}

class _FiboSeriesState extends State<FiboSeries> {
  var val0 = TextEditingController();
  BigInt? fibon;

  @override
  void dispose() {
    val0.dispose();
    super.dispose();
  }

  BigInt? fibonacci(int n, Map<int, BigInt> memo) {
    if (memo.containsKey(n)) {
      return memo[n];
    }
    BigInt result;
    if (n <= 1) {
      result = BigInt.from(n);
    } else {
      result = fibonacci(n - 1, memo)! + fibonacci(n - 2, memo)!;
    }
    memo[n] = result;
    return result;
  }

  void _calculateFibonacci() {
    setState(() {
      int n = int.tryParse(val0.text) ?? 0;
      Map<int, BigInt> memo = {};
      fibon = fibonacci(n, memo)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Fibonacci Series"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the Number",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: val0,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter position in Fibonacci Series",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black))),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: _calculateFibonacci,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.green,
                    fixedSize: Size(140, 20)),
                child: Text(
                  "Enter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            fibon != null
                ? Text(
                    'Fibonacci value: $fibon',
                    style: TextStyle(color: Colors.black),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

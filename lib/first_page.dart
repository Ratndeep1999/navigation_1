import 'package:flutter/material.dart';
import 'package:navigation_1/routes/route_constants.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This add second page in stack'),
              SizedBox(height: 10,),
              SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // different syntax to define route
                    Navigator.of(context).pushNamed(kSecondPage);
                  },
                  child: Text(
                    "Second Screen>>",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

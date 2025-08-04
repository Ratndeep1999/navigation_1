import 'package:flutter/material.dart';
import 'package:navigation_1/routes/route_constants.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {

    final Map? receiveUpdatedData = ModalRoute.of(context)?.settings.arguments as Map? ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Screen'),
        centerTitle: true,
        // it disable (remove) previous arrow button
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name : ${receiveUpdatedData?['name'] ?? 'Not Provided'}', style: TextStyle(fontSize: 30)),
                Text('Age : ${receiveUpdatedData?['age'] ?? 'Not Provided'}', style: TextStyle(fontSize: 30)),
                Text('Gender : ${receiveUpdatedData?['gender'] ?? 'Not Provided'}', style: TextStyle(fontSize: 30)),

                SizedBox(height: 40),
                Text('This pop all pages from stack and drop to first page'),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: Text(
                      '<< First Screen',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Text('This pop pages until last and then add Second page '),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        kSecondPage,  // new route at top of stack
                        ModalRoute.withName(kFirstPage), // remove routes until condition meet
                      );
                    },
                    child: Text(
                      '<<First Screen <<Second Screen ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Text('It replace Fourth page to Second page in stack'),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, kSecondPage);
                    },
                    child: Text(
                      '<< Second Screen',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Text('This pop Fourth page (current) from stack'),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      final dataToPass = {
                        'name': receiveUpdatedData?['name'] ?? 'Not Provided',
                        'age': receiveUpdatedData?['age']?.toString() ?? 'Not Provided',
                        'gender': receiveUpdatedData?['gender'] ?? 'Not Provided',
                      };
                      Navigator.pop(context,dataToPass); // Pass data back to ThirdPage
                    },
                    child: Text(
                      '<<Previous Screen',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

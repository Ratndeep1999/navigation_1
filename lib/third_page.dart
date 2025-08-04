import 'package:flutter/material.dart';
import 'package:navigation_1/routes/route_constants.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _genderCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _genderCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Retrieve the passed data safely
    final Map? receivedData = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name : ${receivedData?['name'] ?? 'Not provided'}', style: TextStyle(fontSize: 30)),
                Text('Age : ${receivedData?['age']?.toString() ?? 'Not provided'}', style: TextStyle(fontSize: 30)),
                SizedBox(height: 40),

                // navigate to fourth screen
                Text('This add fourth page in stack'),
                SizedBox(height: 10),
                SizedBox (
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, kFourthPage);
                    },
                    child: Text(
                      'Fourth Screen>>',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // replace page third to fourth
                Text('It replace third page to fourth page in stack'),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, kFourthPage);
                    },
                    child: Text(
                      'Fourth Screen>>',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Gender
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    controller: _genderCtrl,
                    decoration: InputDecoration(
                      hintText: 'Enter gender',
                      labelText: 'Gender',
                      border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      final updatedData = {
                        'name' : receivedData?['name'],
                        'age' : receivedData?['age'],
                        'gender' : _genderCtrl.text
                      };

                      Navigator.pushNamed(context, kFourthPage, arguments: updatedData);
                    },
                    child: Text(
                      'pass data to Fourth Screen>>',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Text('This pop Third page (current) from stack'),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
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

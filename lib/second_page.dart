import 'package:flutter/material.dart';
import 'package:navigation_1/routes/route_constants.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _nameCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();

  // dispose method to clean controller, this method will call at last
  @override
  void dispose() {
    _nameCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  // Method to clear controllers
  void clearControllers() {
    _nameCtrl.clear();
    _ageCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // navigate ot third screen
                Text('This add third page in stack'),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, kThirdPage);
                    },
                    child: Text(
                        'Third Screen>>', style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(height: 40),

                // replace second page to first page
                Text('It replace second page to first page in stack'),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, kFirstPage);
                    },
                    child: Text(
                        '<<First Screen', style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(height: 40),

                // name
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    controller: _nameCtrl,
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // age
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    controller: _ageCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter age',
                      labelText: 'Age',
                      border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                // send button
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      try {
                        final age = int.parse(_ageCtrl.text);
                        final dataToPass = <String, Object?>{
                          'name': _nameCtrl.text,
                          'age': age,
                        };
                        // data passing I can also use method
                        Navigator.pushNamed(
                            context, kThirdPage, arguments: dataToPass);
                        clearControllers(); // to clean the controllers
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please Enter a valid age')));
                      }
                    },
                    child: Text(
                      'pass data to Third Screen>>',
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

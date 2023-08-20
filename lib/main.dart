import 'package:flutter/material.dart';
import 'package:from_valitaion/constan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Form Valitation'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _fromkey = GlobalKey<FormState>();
  late TextEditingController _text = TextEditingController();
  List<String> mlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
            onPressed: () {
              setState(() {
                mlist.clear();
                showlogerror('mlist data :: ${mlist.length}');
              });
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ]),
      body: Form(
        key: _fromkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _text,
                  // keyboardAppearance: ,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      labelText: 'Enter your text',
                      hintText: 'Type here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                      /* decoration: InputDecoration(
                    label: Text(
                      'user name'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ), */

                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Value";
                    }
                    if (!isTextOnly(value)) {
                      return 'Text only allowed';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    submit_button();
                  },
                  child: Text('submit'.toUpperCase()),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0.0,
        label: Text('Cout : ${mlist.length}'),
        onPressed: () {
          // setState(() {
          //   array_add();
          // });
        },
      ),
    );
  }

  array_add() {
    setState(() {
      mlist.add(_text.text.toString());
    });

    print('mlist data :: ${mlist.length}');
  }

  submit_button() {
    if (_fromkey.currentState!.validate()) {
      showlogerror('enter name is :: ${_text.text.toString()}');
      _text.clear();
      array_add();
    } else {
      return toast('user date found !!! ');
    }
  }

  bool isTextOnly(String input) {
    final RegExp regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(input);
  }
}

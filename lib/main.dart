import 'package:flutter/material.dart';

void main() {
  runApp(ConvertisseurApp());
}

class ConvertisseurApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ConvertisseurHome(),
    );
  }
}

class ConvertisseurHome extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ConvertisseurHomeState createState() => _ConvertisseurHomeState();
}

class _ConvertisseurHomeState extends State<ConvertisseurHome> {
  String _selectedConversion = "EuroToDinar";
  TextEditingController _controller = TextEditingController();
  double _resultat = 0.0;

  void _convertir() {
    setState(() {
      double montant = double.tryParse(_controller.text) ?? 0;
      if (_selectedConversion == "EuroToDinar") {
        _resultat = montant / 3.4; // Exemple de taux de conversion
      } else {
        _resultat = montant * 3.4; // Exemple de taux de conversion
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        title: Text('TP1 App'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Montant",
                ),
              ),
              SizedBox(height: 20),
              RadioListTile(
                title: Text("Dinar ➡ Euro"),
                value: "DinarToEuro",
                groupValue: _selectedConversion,
                onChanged: (value) {
                  setState(() {
                    _selectedConversion = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Euro ➡ Dinar"),
                value: "EuroToDinar",
                groupValue: _selectedConversion,
                onChanged: (value) {
                  setState(() {
                    _selectedConversion = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                "Le résultat est ${_resultat.toStringAsFixed(3)}  dinars !",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertir,
                child: Text("CONVERTIR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 206, 148, 216),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

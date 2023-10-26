import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/update_form.dart';
import 'api_service.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController idController = TextEditingController();
  String jsonData = '';
  final dataEditingController = TextEditingController();

  void _showDataDialog(BuildContext context, String jsonData) {
    if (json.decode(jsonData)['data'] == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ikan Tidak Ada"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Cari Ikan Lagi"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Data Ikan"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (var item in json.decode(jsonData)['data'].entries)
                    Text("${item.key}: ${item.value}"),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cari Ikan Lagi"),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('H1D021009 (A2)'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'ID Ikan'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                fetchData(int.parse(idController.text)).then((data) {
                  setState(() {
                    jsonData = data;
                    // Set the dataEditingController text
                    dataEditingController.text = jsonData;
                  });
                  _showDataDialog(context, jsonData);
                });
              },
              child: Text('Ingatkan!'),
            ),
            if (jsonData != null && jsonData.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => UpdateForm(),
                  ),
                );
              },
              child: Text('Merubah Ingatan Tentang Ikan!'),
            ),
          ],
        ),
      ),
    );

  }
}

void main() {
  runApp(MaterialApp(
    home: LandingPage(),
  ));
}

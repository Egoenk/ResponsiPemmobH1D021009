import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'api_service.dart';

void main() {
  runApp(UpdateFormApp());
}

class UpdateFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpdateForm(),
    );
  }
}

class UpdateForm extends StatefulWidget {
  const UpdateForm({Key? key}) : super(key: key);

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController habitatController = TextEditingController();
  final TextEditingController warnaController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();

  Future<bool> updateAnimal(int id, String name, String habitat, String color) async {
    // Simulate an API call (replace with your actual API call)
    await Future.delayed(Duration(seconds: 2));
    return true; // Return true for success, false for failure
  }

  void handleUpdate() {
    String id = idController.text;
    String name = namaController.text;
    String habitat = habitatController.text;
    String color = warnaController.text;
    String jenis = jenisController.text;

    updateIkan(int.parse(id), name, habitat, color , jenis).then((result) {
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Berhasil Merubah ingatan'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Gagal Merubah Ingatan.'),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merubah Ingatan Tentang Ikan'),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama Ikan'),
            ),
            TextFormField(
              controller: habitatController,
              decoration: InputDecoration(labelText: 'Habitat'),
            ),
            TextFormField(
              controller: warnaController,
              decoration: InputDecoration(labelText: 'Warna'),
            ),TextFormField(
              controller: jenisController,
              decoration: InputDecoration(labelText: 'Jenis'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: ()async{
                handleUpdate();
              },
              child: Text('Ubah Ingatan!'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LandingPage(),
                  ),
                );
              },
              child: Text('Kembali Mengingat Ikan!'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

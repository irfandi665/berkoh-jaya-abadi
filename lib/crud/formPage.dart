import 'package:PostNews/crud/databaseServices.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  String nama = "";
  String author = "";
  String judul = "";
  FormPage({Key? key, this.nama = "", this.author = "", this.judul = ""});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String nama = "";
  String author = "";

  String judul = "";
  var txtnama = TextEditingController();
  var txtauthor = TextEditingController();
  @override
  void initState() {
    super.initState();
    txtnama.text = widget.nama;
    txtauthor.text = widget.author;
    nama = widget.nama;
    author = widget.author;
    judul = widget.judul;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        actions: [
          PopupMenuButton(
            onSelected: popupMenuClick,
            itemBuilder: (BuildContext context) {
              return {'Hapus', 'Menu2'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtnama,
              decoration: InputDecoration(
                  labelText: "nama",
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Berita"),
              onChanged: (value) {
                setState(() {
                  nama = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtauthor,
              decoration: InputDecoration(
                  labelText: "author",
                  border: OutlineInputBorder(),
                  hintText: "Masukkan author"),
              onChanged: (value) {
                setState(() {
                  author = value;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                DatabaseServices.createUpdateMahasiswa(context, nama, author);
              },
              child: Text("Simpan"))
        ],
      ),
    );
  }

  void popupMenuClick(String value) {
    switch (value) {
      case 'Hapus':
        DatabaseServices.deleteMahasiswa(widget.nama);
        Navigator.pop(context);
        break;
      case 'Menu2':
// code saat menu 2 dipilih
        break;
    }
  }
}

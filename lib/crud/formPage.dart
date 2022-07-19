import 'package:PostNews/crud/databaseServices.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  String judul = "";
  String deskripsi = "";
  String author = "";
  String tess = "";
  FormPage(
      {Key? key,
      this.judul = "",
      this.deskripsi = "",
      this.author = "",
      this.tess = ""});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String judul = "";
  String deskripsi = "";
  String author = "";

  String tess = "";
  var txtjudul = TextEditingController();
  var txtdeskripsi = TextEditingController();
  var txtauthor = TextEditingController();
  @override
  void initState() {
    super.initState();
    txtjudul.text = widget.judul;
    txtdeskripsi.text = widget.deskripsi;
    txtauthor.text = widget.author;
    judul = widget.judul;
    deskripsi = widget.deskripsi;
    author = widget.author;
    tess = widget.tess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tess),
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
              controller: txtjudul,
              decoration: InputDecoration(
                  labelText: "judul",
                  border: OutlineInputBorder(),
                  hintText: "judul artikel"),
              onChanged: (value) {
                setState(() {
                  judul = value;
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtdeskripsi,
              decoration: InputDecoration(
                  labelText: "deskripsi",
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Berita"),
              onChanged: (value) {
                setState(() {
                  deskripsi = value;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                DatabaseServices.createUpdateMahasiswa(
                    context, judul, deskripsi, author);
              },
              child: Text("Simpan"))
        ],
      ),
    );
  }

  void popupMenuClick(String value) {
    switch (value) {
      case 'Hapus':
        DatabaseServices.deleteMahasiswa(widget.judul);
        Navigator.pop(context);
        break;
      case 'Menu2':
// code saat menu 2 dipilih
        break;
    }
  }
}

import 'package:PostNews/crud/databaseServices.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  String judul = "";
  String deskripsi = "";
  String author = "";
  String date = '';
  String tess = "";
  FormPage(
      {Key? key,
      this.judul = "",
      this.deskripsi = "",
      this.author = "",
      this.date = '',
      this.tess = ""});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String judul = "";
  String deskripsi = "";
  String author = "";
  String date = '';

  String tess = "";
  var txtjudul = TextEditingController();
  var txtauthor = TextEditingController();
  var txtdate = TextEditingController();
  var txtdeskripsi = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtjudul.text = widget.judul;
    txtauthor.text = widget.author;
    txtdate.text = widget.date;
    txtdeskripsi.text = widget.deskripsi;

    judul = widget.judul;
    deskripsi = widget.deskripsi;
    date = widget.date;
    author = widget.author;
    tess = widget.tess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Artikel"),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
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
            child: DateTimeFormField(
              decoration: InputDecoration(
                  hintText: "Date",
                  labelText: "Date",
                  prefixIcon: Icon(Icons.date_range_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              mode: DateTimeFieldPickerMode.date,
              dateFormat: DateFormat("yyyy-MM-dd"),
              onDateSelected: (DateTime value) {
                setState(() {
                  String formatDate = DateFormat("yyyy-MM-dd").format(value);
                  date = formatDate;
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
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
                    context, judul, deskripsi, author, date);
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

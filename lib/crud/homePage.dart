import 'package:PostNews/crud/formPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('mahasiswa')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          print("${documentSnapshot["judul"]}");
                          return InkWell(
                            child: ListTile(
                              leading: Icon(
                                Icons.person,
                                size: 60,
                              ),
                              title: Text(documentSnapshot["judul"]),
                              subtitle: Text(documentSnapshot["author"]),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FormPage(
                                  tess: "Ubah Data",
                                  judul: documentSnapshot["judul"],
                                  deskripsi: documentSnapshot["deskripsi"],
                                  author: documentSnapshot["author"],
                                );
                              }));
                            },
                          );
                        });
                  } else {
                    return Text("Tidak ada data");
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormPage(tess: "Tambah Data");
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

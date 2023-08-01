import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_baru/model/daftar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive Demo"),
      ),
      body: FutureBuilder(
        future: Hive.openBox("daftars"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              var daftarBox = Hive.box("daftars");
              if (daftarBox.length == 0) {
                daftarBox.add(Daftar("polo", 2));
                daftarBox.add(Daftar("pulo", 5));
              }
              return Container(
                margin: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: daftarBox.length,
                  itemBuilder: (context, index) {
                    Daftar daftar = daftarBox.getAt(index);
                    return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(3, 3),
                              blurRadius: 6)
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${daftar.nama}[${daftar.nomor}]"),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  color: Colors.green,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.copy),
                                  color: Colors.yellow,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                )
                              ],
                            )
                          ],
                        ));
                  },
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

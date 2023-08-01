import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/daftar.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorController = TextEditingController();

  late Box box;

  @override
  void initState() {
    box = Hive.box('daftarBox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD HIVE DEMO"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),

        // list data
        child: ListView.builder(
          itemCount: daftarBox.length,
          itemBuilder: (context, index) {
            Daftar daftar = daftarBox.getAt(index);

            // Container Untuk list
            return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(3, 3),
                      blurRadius: 6)
                ]),

                //row tombol
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
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: Icon(Icons.add),
      ),
    );
  }
}

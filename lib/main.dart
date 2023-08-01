import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_baru/model/daftar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathprovider;
import 'main_page.dart';

Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  final appDocumentDir = await pathprovider.getExternalStorageDirectory();
  final hiveStorageDir = Directory('${appDocumentDir!.path}/DB');
  hiveStorageDir.createSync(recursive: true);
  Hive.init(hiveStorageDir.path);

  //open box
  box = await Hive.openBox('daftarBox');

  // Registrasi adapter dan jalankan aplikasi
  Hive.registerAdapter(DaftarAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

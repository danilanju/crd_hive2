import 'package:hive/hive.dart';
part 'daftar.g.dart';

@HiveType(typeId: 0)
class Daftar {
  @HiveField(0)
  final String nama;
  @HiveField(1)
  final int nomor;

  Daftar(this.nama, this.nomor);
}

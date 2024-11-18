class Yupiterfilm {
  String id;
  DateTime yupiterfilmdate;
  String judul;
  String genre;
  String daftarpemain;
  String deskripsi;
  int liketotal;
  int savedtotal;

  Yupiterfilm({
    required this.id,
    required this.yupiterfilmdate,
    required this.judul,
    required this.genre,
    required this.daftarpemain,
    required this.deskripsi,
    this.liketotal = 0,
    this.savedtotal = 0,
  });
}
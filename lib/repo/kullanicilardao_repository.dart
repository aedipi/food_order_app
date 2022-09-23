import 'package:firebase_database/firebase_database.dart';

class KullanicilarDaoRepository {
  var refKullanicilar = FirebaseDatabase.instance.ref().child("kullanicilar");

  Future<void> kullaniciKayit(String kullanici_ad,String kullanici_email,String kullanici_sifre) async {
    var yeniKullanici = Map<String,dynamic>();
    yeniKullanici["kullanici_id"] = "";
    yeniKullanici["kullanici_ad"] = kullanici_ad;
    yeniKullanici["kullanici_email"] = kullanici_email;
    yeniKullanici["kullanici_sifre"] = kullanici_sifre;
    refKullanicilar.push().set(yeniKullanici);
  }

  Future<void> kullaniciGuncelle(String kullanici_id,String kullanici_ad,String kullanici_email, String kullanici_sifre) async {
    var guncellenenKullanici = Map<String,dynamic>();

    guncellenenKullanici["kullanici_id"] = "";
    guncellenenKullanici["kullanici_ad"] = kullanici_ad;
    guncellenenKullanici["kullanici_email"] = kullanici_email;
    guncellenenKullanici["kullanici_sifre"] = kullanici_sifre;
    refKullanicilar.child(kullanici_id).update(guncellenenKullanici);
  }
}
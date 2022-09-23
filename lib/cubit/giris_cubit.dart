import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/entity/kullanicilar.dart';

class GirisCubit extends Cubit<Kullanicilar> {
  GirisCubit():super(Kullanicilar(kullanici_id: "", kullanici_ad: "",kullanici_email: "", kullanici_sifre: ""));

  var refKullanicilar = FirebaseDatabase.instance.ref().child("kullanicilar");


  Future<void> kullanicilariGetir(String kullanici_ad,String kullanici_sifre) async {
    refKullanicilar.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if(gelenDegerler!=null){
        var liste = <Kullanicilar>[];
        gelenDegerler.forEach((key,nesne){
          var kullanici = Kullanicilar.fromJson(key, nesne);
          if(kullanici_ad==kullanici.kullanici_ad && kullanici_sifre == kullanici.kullanici_sifre){
            liste.add(kullanici);
          }
        });
        emit(liste[0]);
      }
    });
  }
}
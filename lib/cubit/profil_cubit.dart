import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/repo/kullanicilardao_repository.dart';

class ProfilCubit extends Cubit<void> {
  ProfilCubit():super(0);

  var krepo = KullanicilarDaoRepository();

  Future<void> guncelle(String kullanici_id,String kullanici_ad,String kullanici_email,String kullanici_sifre) async {
    await krepo.kullaniciGuncelle(kullanici_id, kullanici_ad, kullanici_email, kullanici_sifre);
  }
}
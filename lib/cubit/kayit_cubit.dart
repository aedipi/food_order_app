import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/repo/kullanicilardao_repository.dart';

class KayitCubit extends Cubit<void> {
  KayitCubit():super(0);

  var krepo = KullanicilarDaoRepository();


  Future<void> kayit(String kullanici_ad,String kullanici_email,String kullanici_sifre) async {
    await krepo.kullaniciKayit(kullanici_ad,kullanici_email, kullanici_sifre);
  }
}
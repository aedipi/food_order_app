import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/repo/sepet_yemeklerdao_repository.dart';

class YemekDetayCubit extends Cubit<void> {
  YemekDetayCubit():super(0);

  var syrepo = SepetYemeklerDaoRepository();

  Future<void> ekle(String yemek_adi, String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,String kullanici_adi) async {
    await syrepo.sepeteYemekEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }
}
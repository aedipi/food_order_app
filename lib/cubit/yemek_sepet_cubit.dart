import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/entity/sepet_yemekler.dart';
import 'package:food_order_app/repo/sepet_yemeklerdao_repository.dart';

class YemekSepetCubit extends Cubit<List<SepetYemekler>> {
  YemekSepetCubit():super(<SepetYemekler>[]);

  var syrepo = SepetYemeklerDaoRepository();

  Future<void> sepettekiYemekleriGetir(String kullanici_adi) async {
    var liste = await syrepo.sepettekiYemekleriGetir(kullanici_adi);
    emit(liste);
  }

  Future<void> sepettenYemekSil(int sepet_yemek_id, String kullanici_adi) async {
    await syrepo.sepettenYemekSil(sepet_yemek_id, kullanici_adi);
    await sepettekiYemekleriGetir(kullanici_adi);
  }
}
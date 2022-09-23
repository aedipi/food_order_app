import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_app/entity/yemekler.dart';
import 'package:food_order_app/repo/yemeklerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>>{
  AnasayfaCubit():super(<Yemekler>[]);

  var yrepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async {
    var liste = await yrepo.tumYemekleriGetir();
    emit(liste);
  }
}
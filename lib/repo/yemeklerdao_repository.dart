import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_order_app/entity/yemekler.dart';
import 'package:food_order_app/entity/yemekler_cevap.dart';

class YemeklerDaoRepository {// dao: Database Access Object

  List<Yemekler> parseYemeklerCevap(String cevap){
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  Future<List<Yemekler>> tumYemekleriGetir() async {
    // GET
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemeklerCevap(cevap.data.toString());
  }

}
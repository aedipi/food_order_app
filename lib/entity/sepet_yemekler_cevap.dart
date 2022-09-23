import 'package:food_order_app/entity/sepet_yemekler.dart';
class SepetYemeklerCevap {
  List<SepetYemekler> sepet_yemekler;
  int success;

  SepetYemeklerCevap({required this.sepet_yemekler,required this.success});

  factory SepetYemeklerCevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["sepet_yemekler"] as List;
    List<SepetYemekler> sepet_yemekler = jsonArray.map((e) => SepetYemekler.fromJson(e)).toList();
    int success = json["success"] as int;
    return SepetYemeklerCevap(sepet_yemekler: sepet_yemekler, success: success);
  }
}
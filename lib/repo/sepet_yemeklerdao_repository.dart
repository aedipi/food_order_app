import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_order_app/entity/sepet_yemekler.dart';
import 'package:food_order_app/entity/sepet_yemekler_cevap.dart';

class SepetYemeklerDaoRepository {
  List<SepetYemekler> parseSepetYemeklerCevap(String cevap){
    return SepetYemeklerCevap.fromJson(json.decode(cevap)).sepet_yemekler;
  }

  Future<void> sepeteYemekEkle(String yemek_adi, String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var veri = {"yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":kullanici_adi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    print("sepete yemek ekle : ${cevap.data.toString()}");
  }

  Future<List<SepetYemekler>> sepettekiYemekleriGetir(String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var veri = {"kullanici_adi":kullanici_adi};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
    return parseSepetYemeklerCevap(cevap.data.toString());
  }

  Future<void> sepettenYemekSil(int sepet_yemek_id, String kullanici_adi) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var veri = {"sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi};
    var cevap = await Dio().post(url,data:FormData.fromMap(veri));
    print("sepetten yemek sil : ${cevap.data.toString()}");
  }
}
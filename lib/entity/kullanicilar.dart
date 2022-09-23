class Kullanicilar {
  String kullanici_id;
  String kullanici_ad;
  String kullanici_email;
  String kullanici_sifre;

  Kullanicilar({
    required this.kullanici_id,
    required this.kullanici_ad,
    required this.kullanici_email,
    required this.kullanici_sifre});

  factory Kullanicilar.fromJson(String key,Map<dynamic,dynamic> json){
    return Kullanicilar(
        kullanici_id: key,
        kullanici_ad: json["kullanici_ad"] as String,
        kullanici_email: json["kullanici_email"] as String,
        kullanici_sifre: json["kullanici_sifre"] as String
    );
  }
}
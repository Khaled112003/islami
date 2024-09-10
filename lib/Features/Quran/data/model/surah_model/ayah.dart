import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final num? number;
  final String? text;
  final num? numberInSurah;
  final num? juz;
  final num? manzil;
  final num? page;
  final num? ruku;
  final num? hizbQuarter;
  final bool? sajda;

  const Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: num.tryParse(json['number'].toString()),
        text: json['text']?.toString(),
        numberInSurah: num.tryParse(json['numberInSurah'].toString()),
        juz: num.tryParse(json['juz'].toString()),
        manzil: num.tryParse(json['manzil'].toString()),
        page: num.tryParse(json['page'].toString()),
        ruku: num.tryParse(json['ruku'].toString()),
        hizbQuarter: num.tryParse(json['hizbQuarter'].toString()),
        sajda: json['sajda']?.toString().contains("true"),
      );

  Map<String, dynamic> toJson() => {
        if (number != null) 'number': number,
        if (text != null) 'text': text,
        if (numberInSurah != null) 'numberInSurah': numberInSurah,
        if (juz != null) 'juz': juz,
        if (manzil != null) 'manzil': manzil,
        if (page != null) 'page': page,
        if (ruku != null) 'ruku': ruku,
        if (hizbQuarter != null) 'hizbQuarter': hizbQuarter,
        if (sajda != null) 'sajda': sajda,
      };

  @override
  List<Object?> get props {
    return [
      number,
      text,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
      sajda,
    ];
  }
}

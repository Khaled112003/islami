import 'package:json_annotation/json_annotation.dart';
import 'ayah.dart'; // تأكد من استيراد نموذج Ayah إذا كان موجودًا في مشروعك

part 'surah_model.g.dart'; // ملف التوليد التلقائي

@JsonSerializable()
class SurahModel {
  final num? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayah>? ayahs;

  SurahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);
  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}

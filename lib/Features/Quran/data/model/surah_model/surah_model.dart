import 'package:equatable/equatable.dart';

import 'ayah.dart';

class SurahModel extends Equatable {
  final num? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayah>? ayahs;

  const SurahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        number: num.tryParse(json['number'].toString()),
        name: json['name']?.toString(),
        englishName: json['englishName']?.toString(),
        englishNameTranslation: json['englishNameTranslation']?.toString(),
        revelationType: json['revelationType']?.toString(),
        ayahs: (json['ayahs'] as List<dynamic>?)
            ?.map((e) => Ayah.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (number != null) 'number': number,
        if (name != null) 'name': name,
        if (englishName != null) 'englishName': englishName,
        if (englishNameTranslation != null)
          'englishNameTranslation': englishNameTranslation,
        if (revelationType != null) 'revelationType': revelationType,
        if (ayahs != null) 'ayahs': ayahs?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      revelationType,
      ayahs,
    ];
  }
}

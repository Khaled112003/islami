import 'package:equatable/equatable.dart';

class Chapter extends Equatable {
  final num? id;
  final String? chapterNumber;
  final String? chapterEnglish;
  final String? chapterUrdu;
  final String? chapterArabic;
  final String? bookSlug;

  const Chapter({
    this.id,
    this.chapterNumber,
    this.chapterEnglish,
    this.chapterUrdu,
    this.chapterArabic,
    this.bookSlug,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: num.tryParse(json['id'].toString()),
        chapterNumber: json['chapterNumber']?.toString(),
        chapterEnglish: json['chapterEnglish']?.toString(),
        chapterUrdu: json['chapterUrdu']?.toString(),
        chapterArabic: json['chapterArabic']?.toString(),
        bookSlug: json['bookSlug']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (chapterNumber != null) 'chapterNumber': chapterNumber,
        if (chapterEnglish != null) 'chapterEnglish': chapterEnglish,
        if (chapterUrdu != null) 'chapterUrdu': chapterUrdu,
        if (chapterArabic != null) 'chapterArabic': chapterArabic,
        if (bookSlug != null) 'bookSlug': bookSlug,
      };

  @override
  List<Object?> get props {
    return [
      id,
      chapterNumber,
      chapterEnglish,
      chapterUrdu,
      chapterArabic,
      bookSlug,
    ];
  }
}

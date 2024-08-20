import 'package:equatable/equatable.dart';

import 'book.dart';
import 'chapter.dart';

class AccidentModel extends Equatable {
  final num? id;
  final String? hadithNumber;
  final String? englishNarrator;
  final String? hadithEnglish;
  final String? hadithUrdu;
  final String? urduNarrator;
  final String? hadithArabic;
  final String? headingArabic;
  final String? headingUrdu;
  final String? headingEnglish;
  final String? chapterId;
  final String? bookSlug;
  final String? volume;
  final String? status;
  final Book? book;
  final Chapter? chapter;

  const AccidentModel({
    this.id,
    this.hadithNumber,
    this.englishNarrator,
    this.hadithEnglish,
    this.hadithUrdu,
    this.urduNarrator,
    this.hadithArabic,
    this.headingArabic,
    this.headingUrdu,
    this.headingEnglish,
    this.chapterId,
    this.bookSlug,
    this.volume,
    this.status,
    this.book,
    this.chapter,
  });

  factory AccidentModel.fromJson(Map<String, dynamic> json) => AccidentModel(
        id: num.tryParse(json['id'].toString()),
        hadithNumber: json['hadithNumber']?.toString(),
        englishNarrator: json['englishNarrator']?.toString(),
        hadithEnglish: json['hadithEnglish']?.toString(),
        hadithUrdu: json['hadithUrdu']?.toString(),
        urduNarrator: json['urduNarrator']?.toString(),
        hadithArabic: json['hadithArabic']?.toString(),
        headingArabic: json['headingArabic']?.toString(),
        headingUrdu: json['headingUrdu']?.toString(),
        headingEnglish: json['headingEnglish']?.toString(),
        chapterId: json['chapterId']?.toString(),
        bookSlug: json['bookSlug']?.toString(),
        volume: json['volume']?.toString(),
        status: json['status']?.toString(),
        book: json['book'] == null
            ? null
            : Book.fromJson(Map<String, dynamic>.from(json['book'])),
        chapter: json['chapter'] == null
            ? null
            : Chapter.fromJson(Map<String, dynamic>.from(json['chapter'])),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (hadithNumber != null) 'hadithNumber': hadithNumber,
        if (englishNarrator != null) 'englishNarrator': englishNarrator,
        if (hadithEnglish != null) 'hadithEnglish': hadithEnglish,
        if (hadithUrdu != null) 'hadithUrdu': hadithUrdu,
        if (urduNarrator != null) 'urduNarrator': urduNarrator,
        if (hadithArabic != null) 'hadithArabic': hadithArabic,
        if (headingArabic != null) 'headingArabic': headingArabic,
        if (headingUrdu != null) 'headingUrdu': headingUrdu,
        if (headingEnglish != null) 'headingEnglish': headingEnglish,
        if (chapterId != null) 'chapterId': chapterId,
        if (bookSlug != null) 'bookSlug': bookSlug,
        if (volume != null) 'volume': volume,
        if (status != null) 'status': status,
        if (book != null) 'book': book?.toJson(),
        if (chapter != null) 'chapter': chapter?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      hadithNumber,
      englishNarrator,
      hadithEnglish,
      hadithUrdu,
      urduNarrator,
      hadithArabic,
      headingArabic,
      headingUrdu,
      headingEnglish,
      chapterId,
      bookSlug,
      volume,
      status,
      book,
      chapter,
    ];
  }
}

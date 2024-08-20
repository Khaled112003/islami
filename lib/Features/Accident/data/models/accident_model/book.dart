import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final num? id;
  final String? bookName;
  final String? writerName;
  final dynamic aboutWriter;
  final String? writerDeath;
  final String? bookSlug;

  const Book({
    this.id,
    this.bookName,
    this.writerName,
    this.aboutWriter,
    this.writerDeath,
    this.bookSlug,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: num.tryParse(json['id'].toString()),
        bookName: json['bookName']?.toString(),
        writerName: json['writerName']?.toString(),
        aboutWriter: json['aboutWriter'],
        writerDeath: json['writerDeath']?.toString(),
        bookSlug: json['bookSlug']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (bookName != null) 'bookName': bookName,
        if (writerName != null) 'writerName': writerName,
        if (aboutWriter != null) 'aboutWriter': aboutWriter,
        if (writerDeath != null) 'writerDeath': writerDeath,
        if (bookSlug != null) 'bookSlug': bookSlug,
      };

  @override
  List<Object?> get props {
    return [
      id,
      bookName,
      writerName,
      aboutWriter,
      writerDeath,
      bookSlug,
    ];
  }
}

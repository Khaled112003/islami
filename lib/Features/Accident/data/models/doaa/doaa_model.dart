import 'package:equatable/equatable.dart';

class DoaaModel extends Equatable {
  final String? category;
  final String? count;
  final String? description;
  final String? reference;
  final String? content;

  const DoaaModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory DoaaModel.fromJson(Map<String, dynamic> json) => DoaaModel(
        category: json['category']?.toString(),
        count: json['count']?.toString(),
        description: json['description']?.toString(),
        reference: json['reference']?.toString(),
        content: json['content']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (category != null) 'category': category,
        if (count != null) 'count': count,
        if (description != null) 'description': description,
        if (reference != null) 'reference': reference,
        if (content != null) 'content': content,
      };

  @override
  List<Object?> get props {
    return [
      category,
      count,
      description,
      reference,
      content,
    ];
  }
}

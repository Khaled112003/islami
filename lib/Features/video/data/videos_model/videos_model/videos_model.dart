import 'package:equatable/equatable.dart';

import 'attachment.dart';

class VideosModel extends Equatable {
  final num? id;
  final num? sourceId;
  final String? title;
  final List<Attachment>? attachments;
  final List<dynamic>? locales;

  const VideosModel({
    this.id,
    this.sourceId,
    this.title,
   
    this.attachments,
    this.locales,
  });

  factory VideosModel.fromJson(Map<String, dynamic> json) => VideosModel(
        id: num.tryParse(json['id'].toString()),
        sourceId: num.tryParse(json['source_id'].toString()),
        title: json['title']?.toString(),
        
        attachments: (json['attachments'] as List<dynamic>?)
            ?.map((e) => Attachment.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        locales: List<dynamic>.from(json['locales'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (sourceId != null) 'source_id': sourceId,
        if (title != null) 'title': title,
        
        if (attachments != null)
          'attachments': attachments?.map((e) => e.toJson()).toList(),
        if (locales != null) 'locales': locales,
      };

  @override
  List<Object?> get props {
    return [
      id,
      sourceId,
      title,
        
      attachments,
      locales,
    ];
  }
}

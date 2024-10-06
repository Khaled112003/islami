import 'package:equatable/equatable.dart';

class Attachment extends Equatable {
  final num? order;
  final String? size;
  final String? extensionType;
  final String? description;
  final String? url;
  const Attachment({
    this.order,
    this.size,
    this.extensionType,
    this.description,
    this.url,
  });
  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        order: num.tryParse(json['order'].toString()),
        size: json['size']?.toString(),
        extensionType: json['extension_type']?.toString(),
        description: json['description']?.toString(),
        url: json['url']?.toString(),
      );
  Map<String, dynamic> toJson() => {
        if (order != null) 'order': order,
        if (size != null) 'size': size,
        if (extensionType != null) 'extension_type': extensionType,
        if (description != null) 'description': description,
        if (url != null) 'url': url,
      };
  @override
  List<Object?> get props {
    return [
      order,
      size,
      extensionType,
      description,
      url,
    ];
  }
}

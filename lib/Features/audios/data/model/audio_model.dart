import 'package:equatable/equatable.dart';

class AudioModel extends Equatable {
  final num? id;
  final String? name;
  final String? url;
  final String? recentDate;

  const AudioModel({this.id, this.name, this.url, this.recentDate});

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        url: json['url']?.toString(),
        recentDate: json['recent_date']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (url != null) 'url': url,
        if (recentDate != null) 'recent_date': recentDate,
      };

  @override
  List<Object?> get props => [id, name, url, recentDate];
}

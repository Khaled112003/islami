import 'package:equatable/equatable.dart';

import 'item.dart';
import 'today_weather.dart';

class PrayerTimeModel extends Equatable {
  final String? title;
  final String? query;
  final String? prayerTimeModelFor;
  final num? method;
  final String? prayerMethodName;
  final String? daylight;
  final String? timezone;
  final String? mapImage;
  final String? sealevel;
  final TodayWeather? todayWeather;
  final String? link;
  final String? qiblaDirection;
  final String? latitude;
  final String? longitude;
  final String? address;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? countryCode;
  final List<Item>? items;
  final num? statusValid;
  final num? statusCode;
  final String? statusDescription;

  const PrayerTimeModel({
    this.title,
    this.query,
    this.prayerTimeModelFor,
    this.method,
    this.prayerMethodName,
    this.daylight,
    this.timezone,
    this.mapImage,
    this.sealevel,
    this.todayWeather,
    this.link,
    this.qiblaDirection,
    this.latitude,
    this.longitude,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
    this.items,
    this.statusValid,
    this.statusCode,
    this.statusDescription,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      title: json['title']?.toString(),
      query: json['query']?.toString(),
      prayerTimeModelFor: json['for']?.toString(),
      method: num.tryParse(json['method'].toString()),
      prayerMethodName: json['prayer_method_name']?.toString(),
      daylight: json['daylight']?.toString(),
      timezone: json['timezone']?.toString(),
      mapImage: json['map_image']?.toString(),
      sealevel: json['sealevel']?.toString(),
      todayWeather: json['today_weather'] == null
          ? null
          : TodayWeather.fromJson(
              Map<String, dynamic>.from(json['today_weather'])),
      link: json['link']?.toString(),
      qiblaDirection: json['qibla_direction']?.toString(),
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      state: json['state']?.toString(),
      postalCode: json['postal_code']?.toString(),
      country: json['country']?.toString(),
      countryCode: json['country_code']?.toString(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      statusValid: num.tryParse(json['status_valid'].toString()),
      statusCode: num.tryParse(json['status_code'].toString()),
      statusDescription: json['status_description']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (title != null) 'title': title,
        if (query != null) 'query': query,
        if (prayerTimeModelFor != null) 'for': prayerTimeModelFor,
        if (method != null) 'method': method,
        if (prayerMethodName != null) 'prayer_method_name': prayerMethodName,
        if (daylight != null) 'daylight': daylight,
        if (timezone != null) 'timezone': timezone,
        if (mapImage != null) 'map_image': mapImage,
        if (sealevel != null) 'sealevel': sealevel,
        if (todayWeather != null) 'today_weather': todayWeather?.toJson(),
        if (link != null) 'link': link,
        if (qiblaDirection != null) 'qibla_direction': qiblaDirection,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (address != null) 'address': address,
        if (city != null) 'city': city,
        if (state != null) 'state': state,
        if (postalCode != null) 'postal_code': postalCode,
        if (country != null) 'country': country,
        if (countryCode != null) 'country_code': countryCode,
        if (items != null) 'items': items?.map((e) => e.toJson()).toList(),
        if (statusValid != null) 'status_valid': statusValid,
        if (statusCode != null) 'status_code': statusCode,
        if (statusDescription != null) 'status_description': statusDescription,
      };

  @override
  List<Object?> get props {
    return [
      title,
      query,
      prayerTimeModelFor,
      method,
      prayerMethodName,
      daylight,
      timezone,
      mapImage,
      sealevel,
      todayWeather,
      link,
      qiblaDirection,
      latitude,
      longitude,
      address,
      city,
      state,
      postalCode,
      country,
      countryCode,
      items,
      statusValid,
      statusCode,
      statusDescription,
    ];
  }
}

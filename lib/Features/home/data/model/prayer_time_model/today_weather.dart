import 'package:equatable/equatable.dart';

class TodayWeather extends Equatable {
  final num? pressure;
  final String? temperature;

  const TodayWeather({this.pressure, this.temperature});

  factory TodayWeather.fromJson(Map<String, dynamic> json) => TodayWeather(
        pressure: num.tryParse(json['pressure'].toString()),
        temperature: json['temperature']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (pressure != null) 'pressure': pressure,
        if (temperature != null) 'temperature': temperature,
      };

  @override
  List<Object?> get props => [pressure, temperature];
}

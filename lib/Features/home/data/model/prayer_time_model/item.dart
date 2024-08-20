import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? dateFor;
  final String? fajr;
  final String? shurooq;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;

  const Item({
    this.dateFor,
    this.fajr,
    this.shurooq,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        dateFor: json['date_for']?.toString(),
        fajr: json['fajr']?.toString(),
        shurooq: json['shurooq']?.toString(),
        dhuhr: json['dhuhr']?.toString(),
        asr: json['asr']?.toString(),
        maghrib: json['maghrib']?.toString(),
        isha: json['isha']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (dateFor != null) 'date_for': dateFor,
        if (fajr != null) 'fajr': fajr,
        if (shurooq != null) 'shurooq': shurooq,
        if (dhuhr != null) 'dhuhr': dhuhr,
        if (asr != null) 'asr': asr,
        if (maghrib != null) 'maghrib': maghrib,
        if (isha != null) 'isha': isha,
      };

  @override
  List<Object?> get props {
    return [
      dateFor,
      fajr,
      shurooq,
      dhuhr,
      asr,
      maghrib,
      isha,
    ];
  }
}

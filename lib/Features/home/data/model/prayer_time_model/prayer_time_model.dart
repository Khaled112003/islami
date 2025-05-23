class PrayerTimeModel {
  final String fajr;
  final String shurooq;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final dynamic date;

  PrayerTimeModel({
    required this.fajr,
    required this.shurooq,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.date,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      fajr: json['fajr'] ?? 'غير متوفر',
      shurooq: json['shurooq'] ?? 'غير متوفر',
      dhuhr: json['dhuhr'] ?? 'غير متوفر',
      asr: json['asr'] ?? 'غير متوفر',
      maghrib: json['maghrib'] ?? 'غير متوفر',
      isha: json['isha'] ?? 'غير متوفر',
      date: json['date_for'] ?? 'غير متوفر',
    );
  }

  // تحويل النموذج إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'fajr': fajr,
      'shurooq': shurooq,
      'dhuhr': dhuhr,
      'asr': asr,
      'maghrib': maghrib,
      'isha': isha,
      'date_for': date
    };
  }
}

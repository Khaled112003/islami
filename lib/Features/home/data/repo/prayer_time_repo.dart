import 'package:dartz/dartz.dart';
import 'package:islami/Features/home/data/model/prayer_time_model/prayer_time_model.dart';

import '../../../../core/errors/failure.dart';

abstract class PrayerTimeRepo {
  Future<Either<Failure, List<PrayerTimeModel>>> fetchPrayerTime();
}

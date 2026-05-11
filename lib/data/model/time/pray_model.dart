class PrayModel {
  final Timings timings;
  final DateInfo date;

  PrayModel({required this.timings, required this.date});

  factory PrayModel.fromJson(Map<String, dynamic> json) {
    return PrayModel(
      timings: Timings.fromJson(json['timings']),
      date: DateInfo.fromJson(json['date']),
    );
  }
}

class Timings {
  final Map<String, String> prayers;

  Timings({required this.prayers});

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      prayers: {
        'Fajr': json['Fajr'],
        'Sunrise': json['Sunrise'],
        'Dhuhr': json['Dhuhr'],
        'Asr': json['Asr'],
        'Maghrib': json['Maghrib'],
        'Isha': json['Isha'],
      },
    );
  }
}

class DateInfo {
  final String readable;
  final Hijri hijri;
  final Gregorian gregorian;

  DateInfo({
    required this.readable,
    required this.hijri,
    required this.gregorian,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) {
    return DateInfo(
      readable: json['readable'],
      hijri: Hijri.fromJson(json['hijri']),
      gregorian: Gregorian.fromJson(json['gregorian']),
    );
  }
}

class Hijri {
  final String day;
  final String year;
  final String monthEn;

  Hijri({required this.day, required this.year, required this.monthEn});

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      day: json['day'],
      year: json['year'],
      monthEn: json['month']['en'],
    );
  }
}

class Gregorian {
  final String weekday;

  Gregorian({required this.weekday});

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(weekday: json['weekday']['en']);
  }
}

class PrayerModel {
  final Timings timings;
  final String gregorianDate;
  final String weekday;
  final String hijriDate;
  final NextPrayer nextPrayer;

  PrayerModel({
    required this.timings,
    required this.gregorianDate,
    required this.weekday,
    required this.hijriDate,
    required this.nextPrayer,
  });

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final gregorian = data['date']['gregorian'];
    final hijri = data['date']['hijri'];

    final timings = Timings.fromJson(data['timings']);

    final month = hijri['month']['en'];
    final shortMonth = month.length >= 3 ? month.substring(0, 3) : month;

    return PrayerModel(
      timings: timings,
      gregorianDate:
          '${gregorian['day']} ${gregorian['month']['en']}, ${gregorian['year']}',
      weekday: gregorian['weekday']['en'],
      hijriDate: '${hijri['day']} $shortMonth, ${hijri['year']}',
      nextPrayer: NextPrayer.fromTimings(timings),
    );
  }
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    String clean(String time) => time.split(' ').first;

    return Timings(
      fajr: clean(json['Fajr']),
      sunrise: clean(json['Sunrise']),
      dhuhr: clean(json['Dhuhr']),
      asr: clean(json['Asr']),
      maghrib: clean(json['Maghrib']),
      isha: clean(json['Isha']),
    );
  }

  List<Map<String, String>> toList() => [
    {'name': 'Fajr', 'time': fajr},
    {'name': 'Sunrise', 'time': sunrise},
    {'name': 'Dhuhr', 'time': dhuhr},
    {'name': 'Asr', 'time': asr},
    {'name': 'Maghrib', 'time': maghrib},
    {'name': 'Isha', 'time': isha},
  ];
}

class NextPrayer {
  final String name;
  final String time;
  final String countdown;

  NextPrayer({required this.name, required this.time, required this.countdown});

  factory NextPrayer.fromTimings(Timings timings) {
    final prayers = timings.toList();
    final now = DateTime.now();

    DateTime buildTime(String time) {
      final parts = time.split(':');
      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    }

    for (final prayer in prayers) {
      final prayerTime = buildTime(prayer['time']!);

      if (now.isBefore(prayerTime)) {
        final diff = prayerTime.difference(now);

        return NextPrayer(
          name: prayer['name']!,
          time: prayer['time']!,
          countdown: _formatDuration(diff),
        );
      }
    }

    // Next day Fajr
    final fajrParts = timings.fajr.split(':');

    final fajrTime = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(fajrParts[0]),
      int.parse(fajrParts[1]),
    );

    final diff = fajrTime.difference(now);

    return NextPrayer(
      name: 'Fajr',
      time: timings.fajr,
      countdown: _formatDuration(diff),
    );
  }

  static String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;

    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}';
  }
}
class ReciterModel {
  final int id;
  final String name;
  final String letter;
  final String date;
  final List<Moshaf> moshaf;

  ReciterModel({
    required this.id,
    required this.name,
    required this.letter,
    required this.date,
    required this.moshaf,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      letter: json['letter'] ?? '',
      date: json['date'] ?? '',
      moshaf:
          (json['moshaf'] as List?)?.map((e) => Moshaf.fromJson(e)).toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'letter': letter,
      'date': date,
      'moshaf': moshaf.map((e) => e.toJson()).toList(),
    };
  }
}

class Moshaf {
  final int id;
  final String name;
  final int rewayaId;
  final String? server;
  final int? surahTotal;
  final int? moshafType;
  final String? surahList;

  Moshaf({
    required this.id,
    required this.name,
    required this.rewayaId,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) {
    return Moshaf(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      rewayaId: json['rewaya_id'] ?? 0,
      server: json['server'],
      surahTotal: json['surah_total'],
      moshafType: json['moshaf_type'],
      surahList: json['surah_list'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rewaya_id': rewayaId,
      'server': server,
      'surah_total': surahTotal,
      'moshaf_type': moshafType,
      'surah_list': surahList,
    };
  }
}
class RecitersModel {
  List<Reciter> reciters;

  RecitersModel({required this.reciters});

  factory RecitersModel.fromJson(Map<String, dynamic> json) {
    return RecitersModel(
      reciters: List<Reciter>.from(
        json['reciters'].map((x) => Reciter.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'reciters': reciters.map((x) => x.toJson()).toList()};
  }
}

class Reciter {
  int id;
  String name;
  String letter;
  String date;
  List<Moshaf> moshaf;

  Reciter({
    required this.id,
    required this.name,
    required this.letter,
    required this.date,
    required this.moshaf,
  });

  factory Reciter.fromJson(Map<String, dynamic> json) {
    return Reciter(
      id: json['id'],
      name: json['name'],
      letter: json['letter'],
      date: json['date'],
      moshaf: List<Moshaf>.from(
        (json['moshaf'] ?? []).map((x) => Moshaf.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'letter': letter,
      'date': date,
      'moshaf': moshaf.map((x) => x.toJson()).toList(),
    };
  }
}

class Moshaf {
  int id;
  String name;
  int rewayaId;
  String? server;
  int? surahTotal;
  int? moshafType;
  String? surahList;

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
      id: json['id'],
      name: json['name'],
      rewayaId: json['rewaya_id'],
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

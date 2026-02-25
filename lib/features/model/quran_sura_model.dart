class QuranSurahModel {
  final String arabicName;
  final String englishName;
  final int verses;

  QuranSurahModel.QuranSurahModel({
    required this.arabicName,
    required this.englishName,
    required this.verses,
  });
  
  static List<QuranSurahModel> quranSurahs = [
    QuranSurahModel.QuranSurahModel(
      arabicName: "الفاتحة",
      englishName: "Al-Fatihah",
      verses: 7,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "البقرة",
      englishName: "Al-Baqarah",
      verses: 286,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "آل عمران",
      englishName: "Aal-E-Imran",
      verses: 200,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النساء",
      englishName: "An-Nisa",
      verses: 176,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المائدة",
      englishName: "Al-Ma'idah",
      verses: 120,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الأنعام",
      englishName: "Al-An'am",
      verses: 165,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الأعراف",
      englishName: "Al-A'raf",
      verses: 206,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الأنفال",
      englishName: "Al-Anfal",
      verses: 75,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "التوبة",
      englishName: "At-Tawbah",
      verses: 129,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "يونس",
      englishName: "Yunus",
      verses: 109,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "هود",
      englishName: "Hud",
      verses: 123,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "يوسف",
      englishName: "Yusuf",
      verses: 111,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الرعد",
      englishName: "Ar-Ra'd",
      verses: 43,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "إبراهيم",
      englishName: "Ibrahim",
      verses: 52,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الحجر",
      englishName: "Al-Hijr",
      verses: 99,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النحل",
      englishName: "An-Nahl",
      verses: 128,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الإسراء",
      englishName: "Al-Isra",
      verses: 111,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الكهف",
      englishName: "Al-Kahf",
      verses: 110,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "مريم",
      englishName: "Maryam",
      verses: 98,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "طه",
      englishName: "Ta‑Ha",
      verses: 135,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الأنبياء",
      englishName: "Al‑Anbiya",
      verses: 112,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الحج",
      englishName: "Al‑Hajj",
      verses: 78,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المؤمنون",
      englishName: "Al‑Mu’minun",
      verses: 118,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النور",
      englishName: "An‑Nur",
      verses: 64,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الفرقان",
      englishName: "Al‑Furqan",
      verses: 77,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الشعراء",
      englishName: "Ash‑Shu’ara",
      verses: 227,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النمل",
      englishName: "An‑Naml",
      verses: 93,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "القصص",
      englishName: "Al‑Qasas",
      verses: 88,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "العنكبوت",
      englishName: "Al‑Ankabut",
      verses: 69,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الروم",
      englishName: "Ar‑Rum",
      verses: 60,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "لقمان",
      englishName: "Luqman",
      verses: 34,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "السجدة",
      englishName: "As‑Sajda",
      verses: 30,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الأحزاب",
      englishName: "Al‑Ahzab",
      verses: 73,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "سبأ",
      englishName: "Saba",
      verses: 54,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "فاطر",
      englishName: "Fatir",
      verses: 45,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "يس",
      englishName: "Ya‑Sin",
      verses: 83,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الصافات",
      englishName: "As‑Saffat",
      verses: 182,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "ص",
      englishName: "Sad",
      verses: 88,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الزمر",
      englishName: "Az‑Zumar",
      verses: 75,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "غافر",
      englishName: "Ghafir",
      verses: 85,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "فصلت",
      englishName: "Fussilat",
      verses: 54,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الشورى",
      englishName: "Ash‑Shura",
      verses: 53,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الزخرف",
      englishName: "Az‑Zukhruf",
      verses: 89,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الدخان",
      englishName: "Ad‑Dukhan",
      verses: 59,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الجاثية",
      englishName: "Al‑Jathiya",
      verses: 37,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الأحقاف",
      englishName: "Al‑Ahqaf",
      verses: 35,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "محمد",
      englishName: "Muhammad",
      verses: 38,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الفتح",
      englishName: "Al‑Fath",
      verses: 29,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الحجرات",
      englishName: "Al‑Hujurat",
      verses: 18,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "ق",
      englishName: "Qaf",
      verses: 45,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الذاريات",
      englishName: "Adh‑Dhariyat",
      verses: 60,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الطور",
      englishName: "At‑Tur",
      verses: 49,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النجم",
      englishName: "An‑Najm",
      verses: 62,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "القمر",
      englishName: "Al‑Qamar",
      verses: 55,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الرحمن",
      englishName: "Ar‑Rahman",
      verses: 78,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الواقعة",
      englishName: "Al‑Waqia",
      verses: 96,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الحديد",
      englishName: "Al‑Hadid",
      verses: 29,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المجادلة",
      englishName: "Al‑Mujadila",
      verses: 22,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الحشر",
      englishName: "Al‑Hashr",
      verses: 24,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الممتحنة",
      englishName: "Al‑Mumtahina",
      verses: 13,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الصف",
      englishName: "As‑Saff",
      verses: 14,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الجمعة",
      englishName: "Al‑Jumu’a",
      verses: 11,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المنافقون",
      englishName: "Al‑Munafiqun",
      verses: 11,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "التغابن",
      englishName: "At‑Taghabun",
      verses: 18,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الطلاق",
      englishName: "At‑Talaq",
      verses: 12,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "التحريم",
      englishName: "At‑Tahrim",
      verses: 12,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الملك",
      englishName: "Al‑Mulk",
      verses: 30,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "القلم",
      englishName: "Al‑Qalam",
      verses: 52,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الحاقة",
      englishName: "Al‑Haqqa",
      verses: 52,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المعارج",
      englishName: "Al‑Ma’arij",
      verses: 44,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "نوح",
      englishName: "Nuh",
      verses: 28,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الجن",
      englishName: "Al‑Jinn",
      verses: 28,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المزمل",
      englishName: "Al‑Muzzammil",
      verses: 20,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المدثر",
      englishName: "Al‑Muddaththir",
      verses: 56,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "القيامة",
      englishName: "Al‑Qiyama",
      verses: 40,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الانسان",
      englishName: "Al‑Insan",
      verses: 31,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المرسلات",
      englishName: "Al‑Mursalat",
      verses: 50,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النبأ",
      englishName: "An‑Naba",
      verses: 40,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النازعات",
      englishName: "An‑Nazi’at",
      verses: 46,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "عبس",
      englishName: "Abasa",
      verses: 42,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "التكوير",
      englishName: "At‑Takwir",
      verses: 29,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الإنفطار",
      englishName: "Al‑Infitar",
      verses: 19,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المطففين",
      englishName: "Al‑Mutaffifin",
      verses: 36,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الإنشقاق",
      englishName: "Al‑Inshiqaq",
      verses: 25,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "البروج",
      englishName: "Al‑Buruj",
      verses: 22,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الطارق",
      englishName: "At‑Tariq",
      verses: 17,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الأعلى",
      englishName: "Al‑Ala",
      verses: 19,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الغاشية",
      englishName: "Al‑Ghashiya",
      verses: 26,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الفجر",
      englishName: "Al‑Fajr",
      verses: 30,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "البلد",
      englishName: "Al‑Balad",
      verses: 20,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الشمس",
      englishName: "Ash‑Shams",
      verses: 15,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الليل",
      englishName: "Al‑Lail",
      verses: 21,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الضحى",
      englishName: "Ad‑Duhaa",
      verses: 11,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الشرح",
      englishName: "Ash‑Sharh",
      verses: 8,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "التين",
      englishName: "At‑Tin",
      verses: 8,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "العلق",
      englishName: "Al‑Alaq",
      verses: 19,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "القدر",
      englishName: "Al‑Qadr",
      verses: 5,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "البينة",
      englishName: "Al‑Bayyina",
      verses: 8,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الزلزلة",
      englishName: "Az‑Zalzala",
      verses: 8,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "العاديات",
      englishName: "Al‑Adiyat",
      verses: 11,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "القارعة",
      englishName: "Al‑Qari’a",
      verses: 11,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "التكاثر",
      englishName: "At‑Takathur",
      verses: 8,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "العصر",
      englishName: "Al‑Asr",
      verses: 3,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الهمزة",
      englishName: "Al‑Humazah",
      verses: 9,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الفيل",
      englishName: "Al‑Fil",
      verses: 5,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "قريش",
      englishName: "Quraish",
      verses: 4,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الماعون",
      englishName: "Al‑Maun",
      verses: 7,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الكوثر",
      englishName: "Al‑Kawthar",
      verses: 3,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الكافرون",
      englishName: "Al‑Kafirun",
      verses: 6,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "النصر",
      englishName: "An‑Nasr",
      verses: 3,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "المسد",
      englishName: "Al‑Masadd",
      verses: 5,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الإخلاص",
      englishName: "Al‑Ikhlas",
      verses: 4,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الفلق",
      englishName: "Al‑Falaq",
      verses: 5,
    ),
    QuranSurahModel.QuranSurahModel(
      arabicName: "الناس",
      englishName: "An‑Nas",
      verses: 6,
    ),
  ];
}

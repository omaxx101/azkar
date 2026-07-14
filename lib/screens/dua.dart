import 'package:flutter/material.dart';

class DuaScreen extends StatelessWidget {
  const DuaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dua"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: duas.length,
        itemBuilder: (context, index) {
          final item = duas[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الدعاء ${item.number}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    item.arabic,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 10),
                  Text(item.english),
                  const SizedBox(height: 5),
                  Text(
                    item.amharic,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 10),
                  Text("Repeat: ${item.count} times"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DuaItem {
  final int number;
  final String arabic;
  final String english;
  final String amharic;
  final int count;

  DuaItem({
    required this.number,
    required this.arabic,
    required this.english,
    required this.amharic,
    required this.count,
  });
}

final List<DuaItem> duas = [

  // ================= AYAT AL-KURSI =================
  DuaItem(
    number: 1,
    arabic:
        "اللّٰهُ لَآ إِلٰهَ إِلَّا هُوَ الْحَىُّ الْقَيُّوْمُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ ... وَهُوَ الْعَلِيُّ الْعَظِيمُ",
    english: "Ayat Al-Kursi (The greatest verse of protection)",
    amharic: "አያት አል-ኩርሲ የጥበቃ ትልቁ አንቀጽ",
    count: 1,
  ),

  // ================= 3 QULS =================
  DuaItem(
    number: 2,
    arabic:
        "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ هُوَ اللَّهُ أَحَدٌ ...",
    english: "Surah Al-Ikhlas",
    amharic: "ሱረት ኢኽላስ",
    count: 3,
  ),

  DuaItem(
    number: 3,
    arabic:
        "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ ...",
    english: "Surah Al-Falaq",
    amharic: "ሱረት አል-ፈለቅ",
    count: 3,
  ),

  DuaItem(
    number: 4,
    arabic:
        "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ النَّاسِ ...",
    english: "Surah An-Nas",
    amharic: "ሱረት ናስ",
    count: 3,
  ),

  // ================= GENERAL DUAS =================
  DuaItem(
    number: 5,
    arabic:
        "اللّٰهُمَّ أَنْتَ رَبِّي لَا إِلٰهَ إِلَّا أَنْتَ خَلَقْتَنِي ... فَاغْفِرْ لِي",
    english: "Dua for forgiveness (Sayyid al-Istighfar)",
    amharic: "የይቅርታ ዱዓ",
    count: 1,
  ),

  DuaItem(
    number: 6,
    arabic:
        "اللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ ...",
    english: "Protection from anxiety and debt",
    amharic: "ከጭንቀት እና ከዕዳ ጥበቃ",
    count: 1,
  ),

  DuaItem(
    number: 7,
    arabic:
        "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً ...",
    english: "Our Lord give us good in this world and the next",
    amharic: "ጌታችን በዚህ ዓለም እና በኋላ መልካም ስጠን",
    count: 1,
  ),

  DuaItem(
    number: 8,
    arabic:
        "اللّٰهُمَّ اغْفِرْ لِي وَارْحَمْنِي وَاهْدِنِي وَعَافِنِي وَارْزُقْنِي",
    english: "Comprehensive dua: forgiveness, mercy, guidance",
    amharic: "ሁሉን የሚጠይቅ ዱዓ",
    count: 1,
  ),

];
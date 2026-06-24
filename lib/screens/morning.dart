import 'package:flutter/material.dart';

class MorningAzkarScreen extends StatelessWidget {
  const MorningAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Morning Azkar የጠዋት አዝካር"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: morningAzkar.length,
        itemBuilder: (context, index) {
          final item = morningAzkar[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
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

class AzkarItem {
  final String title;
  final String arabic;
  final String english;
  final String amharic;
  final int count;

  AzkarItem({
    required this.title,
    required this.arabic,
    required this.english,
    required this.amharic,
    required this.count,
  });
}

final List<AzkarItem> morningAzkar = [
  AzkarItem(
    title: "Ayat Al-Kursi",
    arabic: "اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...",
    english: "Allah! There is no god but He, the Ever-Living, the Sustainer...",
    amharic: "አላህ ከእርሱ በቀር አምላክ የለም፣ ሕያው ዘላለማዊ ነው...",
    count: 1,
  ),
  AzkarItem(
    title: "Surah Al-Ikhlas",
    arabic: "قُلْ هُوَ اللَّهُ أَحَدٌ...",
    english: "Say: He is Allah, One...",
    amharic: "አላህ አንድ ነው በሉ...",
    count: 3,
  ),
  AzkarItem(
    title: "Surah Al-Falaq",
    arabic: "قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ...",
    english: "Say: I seek refuge in the Lord of daybreak...",
    amharic: "በጥላ ጌታ እጠብቃለሁ በሉ...",
    count: 3,
  ),
  AzkarItem(
    title: "Surah An-Nas",
    arabic: "قُلْ أَعُوذُ بِرَبِّ النَّاسِ...",
    english: "Say: I seek refuge in the Lord of mankind...",
    amharic: "የሰዎች ጌታ እጠብቃለሁ በሉ...",
    count: 3,
  ),
  AzkarItem(
    title: "Sayyid al-Istighfar",
    arabic: "اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَٰهَ إِلَّا أَنْتَ...",
    english:
        "O Allah, You are my Lord, none has the right to be worshipped except You...",
    amharic: "አላህ ሆይ አንተ ጌታዬ ነህ...",
    count: 1,
  ),
  AzkarItem(
    title: "Morning Praise",
    arabic: "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ...",
    english: "We have reached the morning and all dominion belongs to Allah...",
    amharic: "ጠዋት ደርሰናል መንግሥት ሁሉ የአላህ ነው...",
    count: 1,
  ),
];

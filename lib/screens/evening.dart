import 'package:flutter/material.dart';

import '../widgets/azkar_ui.dart';

class EveningAzkarScreen extends StatelessWidget {
  const EveningAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AzkarPageScaffold(
      title: 'Evening Azkar ምሽት አዝካር',
      subtitle: '',
      accentColor: const Color(0xFF8E7BFF),
      onHomePressed: () =>
          Navigator.popUntil(context, (route) => route.isFirst),
      audioAssetPath: 'assets/audio/morning_azkar.mp3',
      itemCount: eveningAzkar.length,
      itemBuilder: (context, index) {
        final item = eveningAzkar[index];
        return AzkarContentCard(
          indexLabel: 'الذكر ${item.number}',
          arabicText: item.arabic,
          englishText: item.english,
          amharicText: item.amharic,
          repeatCount: item.count,
          accentColor: const Color(0xFF8E7BFF),
        );
      },
    );
  }
}

class AzkarItem {
  final int number;
  final String arabic;
  final String english;
  final String amharic;
  final int count;

  AzkarItem({
    required this.number,
    required this.arabic,
    required this.english,
    required this.amharic,
    required this.count,
  });
}
final List<AzkarItem> eveningAzkar = [

  AzkarItem(
    number: 1,
    arabic:
        "اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلَا يَئُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ",
    english: "Ayat Al-Kursi",
    amharic: "አያት አል-ኩርሲ",
    count: 1,
  ),

  AzkarItem(
    number: 2,
    arabic:
        "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ هُوَ اللَّهُ أَحَدٌ اللَّهُ الصَّمَدُ لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُن لَهُ كُفُوًا أَحَدٌ",
    english: "Surah Al-Ikhlas",
    amharic: "ሱረት እክላስ",
    count: 3,
  ),

  AzkarItem(
    number: 3,
    arabic:
        "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ مِن شَرِّ مَا خَلَقَ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ",
    english: "Surah Al-Falaq",
    amharic: "ሱረት ፈለቅ",
    count: 3,
  ),

  AzkarItem(
    number: 4,
    arabic:
        "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ النَّاسِ مَلِكِ النَّاسِ إِلَٰهِ النَّاسِ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ مِنَ الْجِنَّةِ وَالنَّاسِ",
    english: "Surah An-Nas",
    amharic: "ሱረት ናስ",
    count: 3,
  ),

  AzkarItem(
    number: 5,
    arabic:
        "أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ رَبِّ الْعَالَمِينَ",
    english: "We reached the evening and dominion belongs to Allah",
    amharic: "ምሽት ደርሰናል",
    count: 1,
  ),

  AzkarItem(
    number: 6,
    arabic:
        "اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَٰهَ إِلَّا أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ",
    english: "Sayyid Al-Istighfar",
    amharic: "የምርጥ ኢስቲግፋር",
    count: 1,
  ),

  AzkarItem(
    number: 7,
    arabic:
        "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَالْعَجْزِ وَالْكَسَلِ وَالْبُخْلِ وَالْجُبْنِ وَغَلَبَةِ الدَّيْنِ",
    english: "Protection from anxiety and debt",
    amharic: "ከጭንቀት መጠበቂያ",
    count: 1,
  ),

  AzkarItem(
    number: 8,
    arabic:
        "يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ",
    english: "Entrust all matters to Allah",
    amharic: "አላህን መመኪያ",
    count: 1,
  ),

  AzkarItem(
    number: 9,
    arabic:
        "حَسْبِيَ اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ",
    english: "Hasbiyallahu",
    amharic: "አላህ በቂኝ ነው",
    count: 7,
  ),

  AzkarItem(
    number: 10,
    arabic:
        "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    english: "SubhanAllah",
    amharic: "ሱብሓነላህ",
    count: 100,
  ),

  AzkarItem(
    number: 11,
    arabic:
        "لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ",
    english: "Tawheed dhikr",
    amharic: "ተውሒድ",
    count: 100,
  ),

  AzkarItem(
    number: 12,
    arabic:
        "سُبْحَانَ اللَّهِ، الْحَمْدُ لِلَّهِ، اللَّهُ أَكْبَرُ",
    english: "Tasbih Tahmid Takbir",
    amharic: "ዚክር",
    count: 100,
  ),

  AzkarItem(
    number: 13,
    arabic:
        "أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ",
    english: "Istighfar",
    amharic: "ኢስቲግፋር",
    count: 100,
  ),

  AzkarItem(
    number: 14,
    arabic:
        "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ",
    english: "Salawat",
    amharic: "ሰላት አለንቢ",
    count: 10,
  ),

  AzkarItem(
    number: 15,
    arabic:
        "أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ",
    english: "Protection from all evil",
    amharic: "ከክፉ መጠበቂያ",
    count: 3,
  ),
];

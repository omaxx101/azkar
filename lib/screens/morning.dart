import 'package:flutter/material.dart';
import '../widgets/azkar_ui.dart';

class MorningAzkarScreen extends StatelessWidget {
  const MorningAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AzkarPageScaffold(
      title: 'Morning Azkar የጠዋት አዝካር',
      subtitle: '',
      accentColor: const Color(0xFFF2C94C),
      onHomePressed: () => Navigator.popUntil(context, (route) => route.isFirst),
      itemCount: morningAzkar.length,
      itemBuilder: (context, index) {
        final item = morningAzkar[index];
        return AzkarContentCard(
          indexLabel: 'الذكر ${item.number}',
          arabicText: item.arabic,
          englishText: item.english,
          amharicText: item.amharic,
          repeatCount: item.count,
          accentColor: const Color(0xFFF2C94C),
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

final List<AzkarItem> morningAzkar = [
  AzkarItem(
  number: 1,
  arabic: "اللّٰهُ لَآ إِلٰهَ إِلَّا هُوَ الْحَىُّ الْقَيُّوْمُ لَا تَأْخُذُهُۥ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلَا يَئُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ",
  english: "Ayat Al-Kursi",
  amharic: "አያት አል-ኩርሲ",
  count: 1,
),

AzkarItem(
  number: 2,
  arabic: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ هُوَ اللَّهُ أَحَدٌ اللَّهُ الصَّمَدُ لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ",
  english: "Surah Al-Ikhlas",
  amharic: "እክላስ",
  count: 3,
),

AzkarItem(
  number: 3,
  arabic: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ مِن شَرِّ مَا خَلَقَ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ",
  english: "Surah Al-Falaq",
  amharic: "ፈለቅ",
  count: 3,
),

AzkarItem(
  number: 4,
  arabic: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ النَّاسِ مَلِكِ النَّاسِ إِلَٰهِ النَّاسِ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ مِنَ الْجِنَّةِ وَالنَّاسِ",
  english: "Surah An-Nas",
  amharic: "ናስ",
  count: 3,
),

AzkarItem(
  number: 5,
  arabic: "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلّٰهِ وَالْحَمْدُ لِلّٰهِ لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ رَبِّ أَسْأَلُكَ خَيْرَ مَا فِي هٰذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هٰذَا الْيَوْمِ وَشَرِّ مَا بَعْدَهُ رَبِّ أَعُوذُ بِكَ مِنَ الْكَسَلِ وَسُوءِ الْكِبَرِ رَبِّ أَعُوذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ",
  english: "Morning remembrance",
  amharic: "የጠዋት ዚክር",
  count: 1,
),

AzkarItem(
  number: 6,
  arabic: "اللّٰهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ وَأَعُوذُ بِكَ مِنَ الْعَجْزِ وَالْكَسَلِ وَأَعُوذُ بِكَ مِنَ الْجُبْنِ وَالْبُخْلِ وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ وَقَهْرِ الرِّجَالِ",
  english: "Protection from anxiety and debt",
  amharic: "ከጭንቀትና ዕዳ መጠበቂያ",
  count: 1,
),

AzkarItem(
  number: 7,
  arabic: "اللّٰهُمَّ إِنِّي أَسْأَلُكَ الْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ اللّٰهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي دِينِي وَدُنْيَايَ وَأَهْلِي وَمَالِي اللّٰهُمَّ اسْتُرْ عَوْرَاتِي وَآمِنْ رَوْعَاتِي اللّٰهُمَّ احْفَظْنِي مِنْ بَيْنِ يَدَيَّ وَمِنْ خَلْفِي وَعَنْ يَمِينِي وَعَنْ شِمَالِي وَمِنْ فَوْقِي وَأَعُوذُ بِعَظَمَتِكَ أَنْ أُغْتَالَ مِنْ تَحْتِي",
  english: "Asking Allah for well-being",
  amharic: "ደህንነትና ጥበቃ መጠየቅ",
  count: 1,
),

AzkarItem(
  number: 8,
  arabic: "يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ",
  english: "Entrust all matters to Allah",
  amharic: "ጉዳዮችን ሁሉ ለአላህ መስጠት",
  count: 1,
),

AzkarItem(
  number: 9,
  arabic: "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلّٰهِ وَالْحَمْدُ لِلّٰهِ لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ رَبِّ أَسْأَلُكَ خَيْرَ مَا فِي هٰذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هٰذَا الْيَوْمِ وَشَرِّ مَا بَعْدَهُ رَبِّ أَعُوذُ بِكَ مِنَ الْكَسَلِ وَسُوءِ الْكِبَرِ رَبِّ أَعُوذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ",
  english: "Morning remembrance",
  amharic: "የጠዋት ዚክር",
  count: 1,
),

AzkarItem(
  number: 10,
  arabic: "حَسْبِيَ اللَّهُ لَا إِلٰهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ",
  english: "Hasbiyallahu",
  amharic: "አላህ በቂኝ ነው",
  count: 7,
),

AzkarItem(
  number: 11,
  arabic: "رَضِيتُ بِاللّٰهِ رَبًّا وَبِالْإِسْلَامِ دِينًا وَبِمُحَمَّدٍ نَبِيًّا",
  english: "Contentment with Allah",
  amharic: "በአላህ መርካት",
  count: 3,
),

AzkarItem(
  number: 12,
  arabic: "بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ",
  english: "Protection in Allah's Name",
  amharic: "በአላህ ስም ጥበቃ",
  count: 3,
),

AzkarItem(
  number: 13,
  arabic: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
  english: "SubhanAllah wa bihamdihi",
  amharic: "ሱብሓነላህ ወቢሐምዲሂ",
  count: 100,
),

AzkarItem(
  number: 14,
  arabic: "لَا إِلٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ",
  english: "Tawheed dhikr",
  amharic: "ተውሒድ",
  count: 100,
),

AzkarItem(
  number: 15,
  arabic: "سُبْحَانَ اللَّهِ الْحَمْدُ لِلَّهِ اللَّهُ أَكْبَرُ",
  english: "Tasbih • Tahmid • Takbir",
  amharic: "ተስቢሕ • ተሕሚድ • ተክቢር",
  count: 100,
),

AzkarItem(
  number: 16,
  arabic: "أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ",
  english: "Istighfar",
  amharic: "ኢስቲግፋር",
  count: 100,
),

AzkarItem(
  number: 17,
  arabic: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ عَدَدَ خَلْقِهِ وَرِضَا نَفْسِهِ وَزِنَةَ عَرْشِهِ وَمِدَادَ كَلِمَاتِهِ",
  english: "SubhanAllahi wa bihamdihi...\n(Three times)",
  amharic: "ሱብሓነላህ ወቢሐምዲሂ\n(3 ጊዜ)",
  count: 3,
),];
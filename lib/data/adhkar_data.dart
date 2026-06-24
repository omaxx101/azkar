import '../models/adhkar_item.dart';

const List<AdhkarItem> adhkarData = [
  AdhkarItem(
    id: 'ayat_al_kursi',
    title: 'Ayat al-Kursi',
    arabicText:
        'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ',
    amharicTranslation:
        'አላህ ብቻ አምላክ ነው፤ እርሱ ሕያው ነው ሁሉን የሚጠብቅ። እንቅልፍ ወይም ድብታ አያይዞትም፤ በሰማያትና በምድር ያለው ሁሉ የእርሱ ነው።',
    reference: 'Qur’an 2:255',
    requiredRepetitions: 1,
    audioAssetPath: 'assets/audio/ayat_al_kursi.mp3',
  ),
  AdhkarItem(
    id: 'surah_al_ikhlas',
    title: 'Surah Al-Ikhlas',
    arabicText: 'قُلْ هُوَ اللَّهُ أَحَدٌ ۝ اللَّهُ الصَّمَدُ ۝ لَمْ يَلِدْ وَلَمْ يُولَدْ ۝ وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
    amharicTranslation:
        'በል፦ እርሱ አላህ አንዱ ነው። አላህ የሁሉ መጠጊያ ነው። አልወለደም አልተወለደምም። እኩል የለውም።',
    reference: 'Qur’an 112',
    requiredRepetitions: 3,
    audioAssetPath: 'assets/audio/al_ikhlas.mp3',
  ),
  AdhkarItem(
    id: 'surah_al_falaq',
    title: 'Surah Al-Falaq',
    arabicText:
        'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ ۝ مِن شَرِّ مَا خَلَقَ ۝ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ۝ وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ ۝ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
    amharicTranslation:
        'በል፦ ከጨለማው ጌታ መጠጊያ እጠይቃለሁ። ከፍጡሩ ክፋት፣ ከጨለማ ሲሰርፍ ከሚመጣው ክፋት፣ በኖቶች ላይ ከሚያፉት ክፋት እና ከቅናተኛው ክፋት እጠገናለሁ።',
    reference: 'Qur’an 113',
    requiredRepetitions: 3,
    audioAssetPath: 'assets/audio/al_falaq.mp3',
  ),
  AdhkarItem(
    id: 'surah_an_nas',
    title: 'Surah An-Nas',
    arabicText:
        'قُلْ أَعُوذُ بِرَبِّ النَّاسِ ۝ مَلِكِ النَّاسِ ۝ إِلَٰهِ النَّاسِ ۝ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ۝ الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ ۝ مِنَ الْجِنَّةِ وَالنَّاسِ',
    amharicTranslation:
        'በል፦ ከሰዎች ጌታ፣ ከሰዎች ንጉሥ፣ ከሰዎች አምላክ መጠጊያ እጠይቃለሁ። ከማንኛውም ውስብስብ መስማማት እና ልብን ከሚያታልል ክፋት እጠገናለሁ።',
    reference: 'Qur’an 114',
    requiredRepetitions: 3,
    audioAssetPath: 'assets/audio/an_nas.mp3',
  ),
  AdhkarItem(
    id: 'sayyid_al_istighfar',
    title: 'Sayyid al-Istighfar',
    arabicText:
        'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَٰهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَىٰ عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ لَكَ بِذَنْبِي فَاغْفِرْ لِي، فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ',
    amharicTranslation:
        'አላህ ሆይ፣ አንተ ጌታዬ ነህ። ከአንተ ውጪ አምላክ የለም። አንተ ፈጠርከኝ እኔም ባሪያህ ነኝ።',
    reference: 'Sahih al-Bukhari',
    requiredRepetitions: 1,
    audioAssetPath: 'assets/audio/sayyid_al_istighfar.mp3',
  ),
  AdhkarItem(
    id: 'morning_praise',
    title: 'Morning Praise',
    arabicText:
        'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ، لَا إِلَٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ، رَبِّ أَسْأَلُكَ خَيْرَ مَا فِي هٰذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هٰذَا الْيَوْمِ وَشَرِّ مَا بَعْدَهُ',
    amharicTranslation:
        'እኛ ጠዋት ደርሰናል፣ ንግሥናም የአላህ ነው። ምስጋናም የአላህ ነው። ከእርሱ በስተቀር አምላክ የለም፤ አጋር የለውም።',
    reference: 'Morning dhikr narration',
    requiredRepetitions: 1,
    audioAssetPath: 'assets/audio/morning_praise.mp3',
  ),
];

class AdhkarItem {
  const AdhkarItem({
    required this.id,
    required this.title,
    required this.arabicText,
    required this.amharicTranslation,
    required this.reference,
    required this.requiredRepetitions,
    required this.audioAssetPath,
  });

  final String id;
  final String title;
  final String arabicText;
  final String amharicTranslation;
  final String reference;
  final int requiredRepetitions;
  final String audioAssetPath;
}

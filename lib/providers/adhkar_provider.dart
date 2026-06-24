import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/adhkar_data.dart';
import '../models/adhkar_item.dart';

class AdhkarProvider extends ChangeNotifier {
  static const String _countsKey = 'adhkar_counts';
  static const String _completedKey = 'adhkar_completed';

  final Map<String, int> _counts = <String, int>{};
  final Set<String> _completedIds = <String>{};

  bool _loaded = false;

  bool get isLoaded => _loaded;

  List<AdhkarItem> get adhkarItems => adhkarData;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedCounts = prefs.getString(_countsKey);
    final encodedCompleted = prefs.getStringList(_completedKey);

    _counts
      ..clear()
      ..addEntries(
        adhkarData.map(
          (item) => MapEntry(item.id, 0),
        ),
      );

    if (encodedCounts != null && encodedCounts.isNotEmpty) {
      final decoded = jsonDecode(encodedCounts) as Map<String, dynamic>;
      for (final entry in decoded.entries) {
        _counts[entry.key] = (entry.value as num).toInt();
      }
    }

    _completedIds
      ..clear()
      ..addAll(encodedCompleted ?? const <String>[]);

    for (final item in adhkarData) {
      if (countFor(item.id) >= item.requiredRepetitions) {
        _completedIds.add(item.id);
      }
    }

    _loaded = true;
    notifyListeners();
  }

  int countFor(String id) => _counts[id] ?? 0;

  int requiredFor(String id) {
    final item = adhkarData.firstWhere((value) => value.id == id);
    return item.requiredRepetitions;
  }

  bool isCompleted(String id) => _completedIds.contains(id);

  int get totalRequiredCount =>
      adhkarData.fold<int>(0, (sum, item) => sum + item.requiredRepetitions);

  int get totalCompletedCount =>
      adhkarData.fold<int>(
        0,
        (sum, item) => sum + countFor(item.id).clamp(0, item.requiredRepetitions).toInt(),
      );

  double get completionProgress {
    if (totalRequiredCount == 0) {
      return 0;
    }
    return totalCompletedCount / totalRequiredCount;
  }

  bool get allCompleted =>
      adhkarData.every((item) => countFor(item.id) >= item.requiredRepetitions);

  Future<void> increment(AdhkarItem item) async {
    final current = countFor(item.id);
    if (current >= item.requiredRepetitions) {
      return;
    }

    _counts[item.id] = current + 1;
    if (_counts[item.id]! >= item.requiredRepetitions) {
      _completedIds.add(item.id);
    }
    await _persist();
    notifyListeners();
  }

  Future<void> reset(AdhkarItem item) async {
    _counts[item.id] = 0;
    _completedIds.remove(item.id);
    await _persist();
    notifyListeners();
  }

  Future<void> resetAll() async {
    for (final item in adhkarData) {
      _counts[item.id] = 0;
    }
    _completedIds.clear();
    await _persist();
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_countsKey, jsonEncode(_counts));
    await prefs.setStringList(_completedKey, _completedIds.toList());
  }
}

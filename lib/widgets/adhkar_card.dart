import 'package:flutter/material.dart';

import '../models/adhkar_item.dart';
import '../providers/adhkar_provider.dart';

class AdhkarCard extends StatelessWidget {
  const AdhkarCard({
    super.key,
    required this.item,
    required this.provider,
    required this.onTap,
  });

  final AdhkarItem item;
  final AdhkarProvider provider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final current = provider.countFor(item.id);
    final progress = current / item.requiredRepetitions;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF173C31),
              const Color(0xFF1E4A3B).withOpacity(0.96),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0x33C9A227),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.auto_stories_outlined, color: Color(0xFFC9A227)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            '${current}/${item.requiredRepetitions}',
                            style: const TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.arabicText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.7,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(value: progress),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.reference,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.78),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(
                provider.isCompleted(item.id)
                    ? Icons.check_circle
                    : Icons.arrow_forward_ios_rounded,
                size: 18,
                color: const Color(0xFFC9A227),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

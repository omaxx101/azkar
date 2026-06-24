import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/adhkar_item.dart';
import '../providers/adhkar_provider.dart';
import '../services/audio_service.dart';

class AdhkarDetailScreen extends StatefulWidget {
  const AdhkarDetailScreen({super.key, required this.item});

  final AdhkarItem item;

  @override
  State<AdhkarDetailScreen> createState() => _AdhkarDetailScreenState();
}

class _AdhkarDetailScreenState extends State<AdhkarDetailScreen> {
  late final AudioService _audioService;

  @override
  void initState() {
    super.initState();
    _audioService = AudioService();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdhkarProvider>(
      builder: (context, provider, _) {
        final current = provider.countFor(widget.item.id);
        final remaining = widget.item.requiredRepetitions - current;
        final completed = provider.isCompleted(widget.item.id);

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.item.title),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0B241D),
                  Color(0xFF12382D),
                  Color(0xFF173C31),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white.withOpacity(0.05),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            widget.item.arabicText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              height: 1.8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.item.amharicTranslation,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              height: 1.7,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    _InfoTile(
                      label: 'Reference',
                      value: widget.item.reference,
                    ),
                    const SizedBox(height: 12),
                    _InfoTile(
                      label: 'Target Repetitions',
                      value: '${widget.item.requiredRepetitions}',
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white.withOpacity(0.05),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Progress',
                                  style: TextStyle(color: Colors.white70, fontSize: 13),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '$current / ${widget.item.requiredRepetitions}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFFE0C46C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: completed
                                  ? const Color(0x33C9A227)
                                  : Colors.white.withOpacity(0.06),
                              border: Border.all(
                                color: completed
                                    ? const Color(0xFFC9A227)
                                    : Colors.white.withOpacity(0.15),
                              ),
                            ),
                            child: Icon(
                              completed ? Icons.verified_rounded : Icons.history_rounded,
                              color: completed ? const Color(0xFFE0C46C) : Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () async {
                        try {
                          await _audioService.play(widget.item.audioAssetPath);
                        } catch (_) {
                          if (!mounted) {
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Audio file not found yet. Add the MP3 to assets/audio.',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Play Audio'),
                    ),
                    const SizedBox(height: 12),
                    FilledButton.tonalIcon(
                      onPressed: completed
                          ? null
                          : () async {
                              await provider.increment(widget.item);
                              if (!mounted) {
                                return;
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    remaining <= 1
                                        ? 'Completed ${widget.item.title}.'
                                        : 'Remaining: ${remaining - 1}',
                                  ),
                                ),
                              );
                            },
                      icon: const Icon(Icons.add_circle_outline),
                      label: Text(completed ? 'Completed' : 'Recite ${remaining > 0 ? remaining : 0} more'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: () async {
                        await provider.reset(widget.item);
                        if (!mounted) {
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${widget.item.title} reset to 0.')),
                        );
                      },
                      icon: const Icon(Icons.restart_alt_rounded),
                      label: const Text('Reset Counter'),
                    ),
                    const SizedBox(height: 12),
                    if (completed)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0x33C9A227),
                          border: Border.all(color: const Color(0xFFC9A227).withOpacity(0.3)),
                        ),
                        child: const Text(
                          'This adhkar is complete. You can reset it if you want to recite again.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, height: 1.5),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFFE0C46C),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

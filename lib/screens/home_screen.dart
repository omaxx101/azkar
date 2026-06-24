import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/adhkar_item.dart';
import '../providers/adhkar_provider.dart';
import '../widgets/adhkar_card.dart';
import 'adhkar_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF071C16),
              Color(0xFF0D3B2E),
              Color(0xFF163D31),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Consumer<AdhkarProvider>(
            builder: (context, provider, _) {
              if (!provider.isLoaded) {
                return const Center(child: CircularProgressIndicator());
              }

              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                      child: _Header(provider: provider),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final AdhkarItem item = provider.adhkarItems[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index == provider.adhkarItems.length - 1 ? 0 : 14,
                            ),
                            child: AdhkarCard(
                              item: item,
                              provider: provider,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => AdhkarDetailScreen(item: item),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        childCount: provider.adhkarItems.length,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.provider});

  final AdhkarProvider provider;

  @override
  Widget build(BuildContext context) {
    final progressPercent = (provider.completionProgress * 100).round();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF12382D).withOpacity(0.94),
            const Color(0xFF1C4D3D).withOpacity(0.96),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0x33C9A227),
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Text(
                'Morning Adhkar',
                style: TextStyle(
                  color: Color(0xFFE0C46C),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'የጠዋት አዝካር',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Recite the morning adhkar with Arabic text, Amharic translation, audio, and progress tracking.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.82),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Completion',
                            style: TextStyle(fontSize: 13, color: Colors.white70),
                          ),
                          Text(
                            '$progressPercent%',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFFE0C46C),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(value: provider.completionProgress),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.08),
                    border: Border.all(color: const Color(0xFFC9A227).withOpacity(0.35)),
                  ),
                  child: Center(
                    child: Text(
                      '$progressPercent',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFE0C46C),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              provider.allCompleted
                  ? 'All adhkar are complete for this session.'
                  : 'Tap any card to open the recitation screen and continue your morning routine.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.86),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

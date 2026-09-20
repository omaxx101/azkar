import 'package:azkar/screens/dua.dart';
import 'package:flutter/material.dart';
import 'morning.dart';
import 'evening.dart';
import '../widgets/azkar_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 720;
            final horizontalPadding = isWide ? 28.0 : 16.0;

            final gridColumns = constraints.maxWidth >= 1100
                ? 3
                : constraints.maxWidth >= 720
                    ? 2
                    : 1;

            final heroWidth =
                constraints.maxWidth >= 900 ? 860.0 : double.infinity;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: heroWidth),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          24,
                          horizontalPadding,
                          20,
                        ),
                        child: const _HomeHero(),
                      ),
                    ),

                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        0,
                        horizontalPadding,
                        28,
                      ),
                      sliver: SliverGrid(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridColumns,
                          mainAxisExtent:
                              constraints.maxWidth >= 720 ? 220 : 190,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                        ),
                        delegate: SliverChildListDelegate.fixed(
                          [
                            AzkarHomeTile(
                              title: 'Morning Azkar • የጠዋት አዝካር',
                              subtitle: '',
                              icon: Icons.wb_sunny_rounded,
                              accentColor: Colors.yellow.shade700,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const MorningAzkarScreen(),
                                  ),
                                );
                              },
                            ),

                            AzkarHomeTile(
                              title: 'Evening Azkar • የማታ አዝካር',
                              subtitle: '',
                              icon: Icons.nights_stay_rounded,
                              accentColor: const Color(0xFF8E7BFF),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const EveningAzkarScreen(),
                                  ),
                                );
                              },
                            ),

                            AzkarHomeTile(
                              title: 'Dua • ዱዓ',
                              subtitle: '',
                              icon: Icons.mosque_rounded,
                              accentColor: const Color(0xFF8AD8B5),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const DuaScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HomeHero extends StatelessWidget {
  const _HomeHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF18221D),
            Color(0xFF10151D),
          ],
        ),
        border: Border.all(
          color: Color(0xFF2C3A32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFF8AD8B5).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: Color(0xFF8AD8B5),
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  'Azkar',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            'Remember Allah throughout your day.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Morning, evening, and daily duas in one simple place.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }
}

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
            final heroWidth = constraints.maxWidth >= 900 ? 860.0 : double.infinity;

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
                        child: _HomeHero(),
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridColumns,
                          mainAxisExtent: constraints.maxWidth >= 720 ? 220 : 190,
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
                                    builder: (_) => const MorningAzkarScreen(),
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
                                    builder: (_) => const EveningAzkarScreen(),
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF17382F).withOpacity(0.95),
            const Color(0xFF10251F).withOpacity(0.92),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.22),
            blurRadius: 30,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Azkar & Dua • አዝካር  እና ዱዓ',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize:25 ,
              height:1,
            ),
          ),
        ],
      ),
    );
  }
}

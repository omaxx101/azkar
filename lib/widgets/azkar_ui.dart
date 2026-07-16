import 'package:flutter/material.dart';

class AzkarPageScaffold extends StatelessWidget {
  const AzkarPageScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.itemCount,
    required this.itemBuilder,
    this.onHomePressed,
  });

  final String title;
  final String subtitle;
  final Color accentColor;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final VoidCallback? onHomePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _BackgroundPattern(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final horizontalPadding =
                    constraints.maxWidth >= 900 ? 32.0 : 16.0;
                final contentWidth = constraints.maxWidth >= 900 ? 860.0 : double.infinity;

                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: contentWidth),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              horizontalPadding,
                              12,
                              horizontalPadding,
                              20,
                            ),
                            child: _PageHeader(
                              title: title,
                              subtitle: subtitle,
                              accentColor: accentColor,
                              onHomePressed: onHomePressed,
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.fromLTRB(
                            horizontalPadding,
                            0,
                            horizontalPadding,
                            32,
                          ),
                          sliver: SliverList.separated(
                            itemCount: itemCount,
                            itemBuilder: itemBuilder,
                            separatorBuilder: (_, __) => const SizedBox(height: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AzkarContentCard extends StatelessWidget {
  const AzkarContentCard({
    super.key,
    required this.indexLabel,
    required this.arabicText,
    required this.englishText,
    required this.amharicText,
    required this.repeatCount,
    required this.accentColor,
  });

  final String indexLabel;
  final String arabicText;
  final String englishText;
  final String amharicText;
  final int repeatCount;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasEnglish = englishText.trim().isNotEmpty;
    final hasAmharic = amharicText.trim().isNotEmpty;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: accentColor.withOpacity(0.32)),
                  ),
                  child: Text(
                    indexLabel,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${repeatCount}x',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.12),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.white.withOpacity(0.06)),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  arabicText,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.titleLarge?.copyWith(
                    height: 1.8,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (hasEnglish || hasAmharic) ...[
              const SizedBox(height: 14),
              if (hasEnglish)
                Text(
                  englishText,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.92),
                    height: 1.5,
                  ),
                ),
              if (hasEnglish && hasAmharic) const SizedBox(height: 8),
              if (hasAmharic)
                Text(
                  amharicText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: accentColor.withOpacity(0.95),
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class AzkarHomeTile extends StatelessWidget {
  const AzkarHomeTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accentColor.withOpacity(0.22),
                accentColor.withOpacity(0.08),
              ],
            ),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: accentColor.withOpacity(0.24)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(icon, color: accentColor, size: 30),
                ),
                const SizedBox(height: 28),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.78),
                        height: 1.45,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BackgroundPattern extends StatelessWidget {
  const _BackgroundPattern();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0B1813),
            Color(0xFF071410),
            Color(0xFF05100D),
          ],
        ),
      ),
      child: SizedBox.expand(),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.onHomePressed,
  });

  final String title;
  final String subtitle;
  final Color accentColor;
  final VoidCallback? onHomePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (Navigator.of(context).canPop())
              IconButton(
                onPressed: onHomePressed ?? () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                tooltip: 'Back',
              )
            else
              const SizedBox(width: 48),
            Expanded(
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: accentColor.withOpacity(0.28)),
                  ),
                  child: Text(
                    'Azkar',
                    style: theme.textTheme.labelLarge?.copyWith(
                      letterSpacing: 1.2,
                      color: accentColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.78),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

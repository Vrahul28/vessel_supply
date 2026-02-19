import 'package:flutter/material.dart';

import 'article_tile.dart';

class ArticlesCard extends StatelessWidget {
  const ArticlesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = [
      'Troubleshooting Connection Issues',
      'Ordering Spare Parts & Supplies',
      'Understanding Inventory Risk',
      'Syncing Data with Shore Office',
      'Preparing for Vessel Inspection',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: List.generate(
          articles.length,
              (index) => Column(
            children: [
              ArticleTile(title: articles[index]),
              if (index < articles.length - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Color(0xFFEEEEEE),
                    height: 1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
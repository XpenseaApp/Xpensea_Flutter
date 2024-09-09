import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/data/routes/user_api_routes.dart';
import 'package:xpensea/src/presentation/components/appbar/appbar_backbutton.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(GetPolicyProvider(token)).value;
        log('DATA: $data');
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonAppBarWback(index: 0, heading: 'Policy'),
                        const SizedBox(height: 24),
                        buildPolicySection(
                            'Policy Details', data['policyDetails']),
                        const SizedBox(height: 24),
                        buildPolicySection('Accuracy', data['accuracy']),
                        const SizedBox(height: 24),
                        buildPolicySection(
                            'Authenticity', data['authenticity']),
                        const SizedBox(height: 24),
                        buildPolicySection('Compliance', data['compliance']),
                        const SizedBox(height: 24),
                        buildPolicySection('Relevance', data['relevance']),
                        const SizedBox(height: 24),
                        buildPolicySection(
                            'Completeness', data['completeness']),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPolicySection(String title, String body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

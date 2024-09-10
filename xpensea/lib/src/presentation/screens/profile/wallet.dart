import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';
import 'package:xpensea/src/presentation/components/appbar/appbar_backbutton.dart';
import 'package:xpensea/src/presentation/components/cards/wallet_card.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(GetWalletProvider(token)).value;
        log('DATA: $data');
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: data == null
                  ? const Center(child: CircularProgressIndicator())
                  : CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonAppBarWback(index: 0, heading: 'Wallet'),
                              const SizedBox(height: 16),
                              WalletCard(
                                advanceAmount: data['data']['data']
                                    ['totalAmount'],
                                amountUsed: data['data']['data']
                                    ['totalExpenses'],
                              ),
                              const SizedBox(height: 16),
                              data['data']['data']['expenses'].isEmpty
                                  ? const SizedBox.shrink()
                                  : Expanded(
                                      child: ListView.builder(
                                        itemCount: data['data']['data']
                                                ['expenses']
                                            .length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(data['data']['data']
                                                    ['expenses'][index]
                                                ['expenseName']),
                                            subtitle: Text(data['data']['data']
                                                        ['expenses'][index]
                                                    ['amount']
                                                .toString()),
                                          );
                                        },
                                      ),
                                    ),
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
}

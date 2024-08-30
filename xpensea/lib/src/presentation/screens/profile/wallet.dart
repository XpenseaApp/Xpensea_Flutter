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
import 'package:xpensea/src/presentation/components/cards/wallet_card.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(GetWalletProvider(token)).value;
        log('DATA: ' + data.toString());
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: data == null
                  ? Center(child: CircularProgressIndicator())
                  : CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonAppBarWback(index: 0, heading: 'Wallet'),
                              const SizedBox(height: 16),
                              WalletCard(
                                advanceAmount: data['data']['data']
                                    ['totalAmount'],
                                amountUsed: data['data']['data']
                                    ['totalExpenses'],
                              ),
                              const SizedBox(height: 16),
                              data['data']['data']['expenses'].isEmpty
                                  ? SizedBox.shrink()
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

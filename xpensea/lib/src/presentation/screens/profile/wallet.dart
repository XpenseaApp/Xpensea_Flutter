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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const CommonAppBarWback(
              index: 0,
              heading: 'Wallet',
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: const Color(0xFFF5F5F5), // Light background color
          body: data == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Wallet Card at the top
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: WalletCard(
                        advanceAmount: data['data']['data']['totalAmount'],
                        amountUsed: data['data']['data']['totalExpenses'],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // List of Expenses
                    data['data']['data']['expenses'].isEmpty
                        ? const Center(
                            child: Text(
                              'No expenses found',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount:
                                  data['data']['data']['expenses'].length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, index) {
                                var expense =
                                    data['data']['data']['expenses'][index];

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 3,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.blueAccent,
                                        child: const Icon(
                                          Icons.attach_money,
                                          color: Colors.white,
                                        ),
                                      ),
                                      title: Text(
                                        expense['title'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Amount: ₹${expense['amount']}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
        );
      },
    );
  }
}

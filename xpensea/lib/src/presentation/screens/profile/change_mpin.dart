import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/user_api_routes.dart';
import 'package:xpensea/src/presentation/components/appbar/appbar_backbutton.dart';

class ChangeMPINPage extends StatelessWidget {
  final TextEditingController oldMPINController = TextEditingController();
  final TextEditingController newMPINController = TextEditingController();

  ChangeMPINPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CommonAppBarWback(index: 0, heading: 'Change MPIN'),
                    const SizedBox(height: 16),
                    Center(
                      heightFactor: 2.5,
                      child: Container(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            TextField(
                              controller: oldMPINController,
                              decoration: InputDecoration(
                                labelText: 'Old MPIN',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: newMPINController,
                              decoration: InputDecoration(
                                labelText: 'New MPIN',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () async {
                                final oldMPIN = oldMPINController.text;
                                final newMPIN = newMPINController.text;

                                if (oldMPIN.isEmpty || newMPIN.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: AppPalette.kPrimaryColor,
                                      content:
                                          Text('Please fill in all fields'),
                                    ),
                                  );
                                  return;
                                }

                                // Handle MPIN change logic here
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                String? savedNumber = prefs.getString('number');
                                final Response = await ApiService().changeMpin(
                                    savedNumber!, newMPIN, oldMPIN, token);
                                log('Old MPIN: $oldMPIN, New MPIN: $newMPIN');
                                log('Response: $Response');
                                // Clear the text fields
                                oldMPINController.clear();
                                newMPINController.clear();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppPalette.kPrimaryColor,
                                    content: Text(Response['data']['message']),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppPalette.kPrimaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text('Submit',
                                  style: AppTextStyle.kSmallBodySB
                                      .copyWith(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

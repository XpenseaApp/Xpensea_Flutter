import 'package:flutter/material.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';

class WalletCard extends StatelessWidget {
  final int advanceAmount;
  final int amountUsed;

  const WalletCard(
      {super.key, required this.advanceAmount, required this.amountUsed});

  @override
  Widget build(BuildContext context) {
    double amountLeft = double.parse((advanceAmount - amountUsed).toString());
    double leftPercentage = (amountLeft / advanceAmount) * 100;
    if (leftPercentage.isNaN) {
      leftPercentage = 0.0;
    }

    return Card(
      elevation: 10.0,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              AppPalette.kPrimaryColor,
              Color.fromARGB(255, 0, 28, 99),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 24.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Wallet Details',
                  style: AppTextStyle.kMediumBodyM.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Divider(color: Colors.white10),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_balance,
                      color: Colors.grey[200],
                      size: 22.0,
                    ),
                    SizedBox(width: 8.0),
                    Text('Advance Amount',
                        style: AppTextStyle.kMediumBodyM.copyWith(
                          fontSize: 16.0,
                          color: Colors.white70,
                        )),
                  ],
                ),
                Text(
                  '₹${advanceAmount.toStringAsFixed(2)}',
                  style: AppTextStyle.kMediumBodyM.copyWith(
                    fontSize: 16.0,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.greenAccent,
                      size: 22.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Amount Left',
                      style: AppTextStyle.kMediumBodyM.copyWith(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Text(
                  '₹${amountLeft.toStringAsFixed(2)}',
                  style: AppTextStyle.kMediumBodyM.copyWith(
                    fontSize: 16.0,
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            LinearProgressIndicator(
              value: leftPercentage / 100,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              minHeight: 6.0,
            ),
            SizedBox(height: 15.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController amountController =
                          TextEditingController();
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Request Advance'),
                        content: TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Enter amount (₹)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // You can add the logic to handle the advance request here
                              String enteredAmount = amountController.text;
                              postTransaction(
                                  userId, userId, enteredAmount, token);

                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white, // Black text
                ),
                child: Text('Request Advance'),
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}

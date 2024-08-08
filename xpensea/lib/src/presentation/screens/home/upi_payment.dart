// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
// import 'package:upi_india/upi_india.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Test UPI',
//       home: const UpiPage(),
//     );
//   }
// }

// class UpiPage extends StatefulWidget {
//   const UpiPage({Key? key}) : super(key: key);

//   @override
//   State<UpiPage> createState() => _UpiPageState();
// }

// class _UpiPageState extends State<UpiPage> {
//   String barcode = 'Tap to scan';
//   double amount = 0.0;
//   Future<UpiResponse>? _transaction;
//   UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;

//   @override
//   void initState() {
//     super.initState();
//     _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
//       setState(() {
//         apps = value;
//       });
//     }).catchError((e) {
//       apps = [];
//     });
//   }

//   Future<UpiResponse> initiateTransaction(UpiApp app) async {
//     return _upiIndia.startTransaction(
//       app: app,
//       receiverUpiId: barcode.split('pa=')[1].split('&pn=')[0],
//       receiverName: 'Payee',
//       transactionRefId: 'TestingUpiIndiaPlugin',
//       transactionNote: 'Not actual. Just an example.',
//       amount: amount,
//     );
//   }

//   void _scanBarcode() async {
//     final res = await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => AiBarcodeScanner(
//           onScan: (p0) {},
//           onDispose: () {
//             debugPrint("Barcode scanner disposed!");
//           },
//           controller: MobileScannerController(
//             detectionSpeed: DetectionSpeed.noDuplicates,
//           ),
//           onDetect: (barcodeData) {
//             setState(() {
//               barcode = barcodeData.barcodes.first.rawValue.toString();
//               log(barcode, name: 'Barcode');
//               if (!_isUpiCode(barcode)) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Not a valid UPI QR code')),
//                 );
//                 barcode = 'Tap to scan';
//               }
//             });
//           },
//         ),
//       ),
//     );
//   }

//   bool _isUpiCode(String code) {
//     return code.contains('upi://pay?');
//   }

//   void _showAmountInputDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Enter Amount'),
//           content: TextField(
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               amount = double.tryParse(value) ?? 0.0;
//             },
//             decoration: const InputDecoration(hintText: 'Enter amount'),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _startTransaction();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _startTransaction() async {
//     if (_isUpiCode(barcode)) {
//       UpiApp? selectedApp;
//       if (apps != null && apps!.isNotEmpty) {
//         selectedApp = apps!.firstWhere(
//           (app) => app.name == paymentappoptions,
//           orElse: () => apps!.first,
//         );
//       }
//       if (selectedApp != null) {
//         _transaction = initiateTransaction(selectedApp);
//         setState(() {});
//       } else {
//         log('No UPI apps available');
//       }
//     } else {
//       log('Invalid UPI code');
//     }
//   }

//   String _upiErrorHandler(error) {
//     switch (error) {
//       case UpiIndiaAppNotInstalledException:
//         return 'Requested app not installed on device';
//       case UpiIndiaUserCancelledException:
//         return 'You cancelled the transaction';
//       case UpiIndiaNullResponseException:
//         return 'Requested app didn\'t return any response';
//       case UpiIndiaInvalidParametersException:
//         return 'Requested app cannot handle the transaction';
//       default:
//         return 'An Unknown error has occurred';
//     }
//   }

//   void _checkTxnStatus(String status) {
//     switch (status) {
//       case UpiPaymentStatus.SUCCESS:
//         log('Transaction Successful');
//         break;
//       case UpiPaymentStatus.SUBMITTED:
//         log('Transaction Submitted');
//         break;
//       case UpiPaymentStatus.FAILURE:
//         log('Transaction Failed');
//         break;
//       default:
//         log('Received an Unknown transaction status');
//     }
//   }

//   Widget displayTransactionData(title, body) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("$title: ",
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           Flexible(
//               child: Text(
//             body,
//             style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
//           )),
//         ],
//       ),
//     );
//   }

//   Widget displayUpiApps() {
//     if (apps == null)
//       return const Center(child: CircularProgressIndicator());
//     else if (apps!.isEmpty)
//       return const Center(
//         child: Text(
//           "No apps found to handle transaction.",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       );
//     else
//       return Align(
//         alignment: Alignment.topCenter,
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Wrap(
//             children: apps!.map<Widget>((UpiApp app) {
//               return GestureDetector(
//                 onTap: () {
//                   _transaction = initiateTransaction(app);
//                   setState(() {});
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.memory(
//                         app.icon,
//                         height: 60,
//                         width: 60,
//                       ),
//                       Text(app.name),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('UPI Scanner and Payment'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: displayUpiApps(),
//           ),
//           Expanded(
//             child: FutureBuilder(
//               future: _transaction,
//               builder:
//                   (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text(
//                         _upiErrorHandler(snapshot.error.runtimeType),
//                         style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     );
//                   }

//                   UpiResponse _upiResponse = snapshot.data!;
//                   String txnId = _upiResponse.transactionId ?? 'N/A';
//                   String resCode = _upiResponse.responseCode ?? 'N/A';
//                   String txnRef = _upiResponse.transactionRefId ?? 'N/A';
//                   String status = _upiResponse.status ?? 'N/A';
//                   String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
//                   _checkTxnStatus(status);

//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         displayTransactionData('Transaction Id', txnId),
//                         displayTransactionData('Response Code', resCode),
//                         displayTransactionData('Reference Id', txnRef),
//                         displayTransactionData('Status', status.toUpperCase()),
//                         displayTransactionData('Approval No', approvalRef),
//                       ],
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: Text(''),
//                   );
//                 }
//               },
//             ),
//           ),
//           ElevatedButton(
//             child: const Text('Scan Barcode'),
//             onPressed: _scanBarcode,
//           ),
//           ElevatedButton(
//             child: const Text('Enter Amount and Pay'),
//             onPressed: barcode == 'Tap to scan' ? null : _showAmountInputDialog,
//           ),
//           Text(barcode),
//         ],
//       ),
//     );
//   }
// }

// const List<String> paymentappoptions = [
//   'Amazon Pay',
//   'BHIMUPI',
//   'Google Pay',
//   'Mi Pay',
//   'Mobikwik',
//   'Airtel Thanks',
//   'Paytm',
//   'PhonePe',
//   'SBI PAY',
// ];

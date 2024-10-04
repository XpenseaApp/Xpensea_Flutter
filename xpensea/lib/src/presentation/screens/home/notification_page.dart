import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/routes/helper/user_helper.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy notification data
    // final List<Map<String, dynamic>> unreadNotifications = [
    //   {
    //     'subject': 'New Promotion',
    //     'content': 'Get 50% off on your next purchase',
    //     'updatedAt': DateTime.now(),
    //   },
    //   {
    //     'subject': 'Limited Time Offer',
    //     'content': 'Free shipping on orders above \$100',
    //     'updatedAt': DateTime.now().subtract(Duration(hours: 2)),
    //   }
    // ];

    // final List<Map<String, dynamic>> readNotifications = [
    //   {
    //     'subject': 'System Update',
    //     'content': 'Your system has been updated successfully',
    //     'updatedAt': DateTime.now().subtract(Duration(days: 1)),
    //   },
    //   {
    //     'subject': 'Reminder',
    //     'content': 'Don’t forget to complete your purchase',
    //     'updatedAt': DateTime.now().subtract(Duration(days: 2)),
    //   }
    // ];
    return Consumer(
      builder: (context, ref, child) {
        final List notifications =
            ref.watch(notificationListProvider(token)).value ?? [];
        log('Notifications: $notifications');
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            title: const Text('Notifications'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Display unread notifications
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return _buildNotificationCard(
                      readed: notification['isRead'],
                      subject: notification['content']['title'],
                      content: notification['content']['description'],
                      dateTime: DateTime.parse(notification['updatedAt']),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationCard({
    required bool readed,
    required String subject,
    required String content,
    required DateTime dateTime,
  }) {
    String time = timeAgo(dateTime);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Card(
        elevation: 1,
        color: readed ? const Color(0xFFF2F2F2) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (!readed)
                    const Icon(Icons.circle, color: Colors.blue, size: 12),
                  const SizedBox(width: 8),
                  Text(
                    subject,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String timeAgo(DateTime pastDate) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(pastDate);

  // Get the number of days, hours, and minutes
  int days = difference.inDays;
  int hours = difference.inHours % 24;
  int minutes = difference.inMinutes % 60;

  // Generate a human-readable string based on the largest unit
  if (days > 0) {
    return '$days day${days > 1 ? 's' : ''} ago';
  } else if (hours > 0) {
    return '$hours hour${hours > 1 ? 's' : ''} ago';
  } else if (minutes > 0) {
    return '$minutes minute${minutes > 1 ? 's' : ''} ago';
  } else {
    return 'Just now';
  }
}

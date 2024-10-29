// NotificationService.swift
import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        guard let bestAttemptContent = request.content.mutableCopy() as? UNMutableNotificationContent else {
            contentHandler(request.content)
            return
        }
        
        // Check if this is a banking SMS notification
        if let message = bestAttemptContent.body, isBankingTransaction(message) {
            // Parse transaction details
            if let transactionDetails = parseTransaction(from: message) {
                // Add transaction details as custom data
                bestAttemptContent.userInfo["transactionAmount"] = transactionDetails.amount
                bestAttemptContent.userInfo["transactionVPA"] = transactionDetails.vpa
                bestAttemptContent.userInfo["transactionRef"] = transactionDetails.refNo
                bestAttemptContent.userInfo["transactionTime"] = transactionDetails.timestamp
            }
        }
        
        contentHandler(bestAttemptContent)
    }
    
    private func isBankingTransaction(_ message: String) -> Bool {
        // Check if the message matches banking transaction format
        return message.contains("debited") && message.contains("UPI Ref No")
    }
    
    private struct TransactionDetails {
        let amount: String
        let vpa: String
        let refNo: String
        let timestamp: String
    }
    
    private func parseTransaction(from message: String) -> TransactionDetails? {
        // Regular expression to parse transaction details
        let pattern = "Rs (\\d+\\.\\d{2}).*VPA ([\\w@]+).*UPI Ref No (\\d+)"
        
        guard let regex = try? NSRegularExpression(pattern: pattern),
              let match = regex.firstMatch(in: message, range: NSRange(message.startIndex..., in: message)) else {
            return nil
        }
        
        let amount = (message as NSString).substring(with: match.range(at: 1))
        let vpa = (message as NSString).substring(with: match.range(at: 2))
        let refNo = (message as NSString).substring(with: match.range(at: 3))
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        
        return TransactionDetails(amount: amount, vpa: vpa, refNo: refNo, timestamp: timestamp)
    }
}
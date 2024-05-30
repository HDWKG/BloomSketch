import Foundation
import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var title: String?
    var message: String?
    
    override var body: NotificationView {
        return NotificationView(
            title: title,
            message: message
        )
    }

    override func didReceive(_ notification: UNNotification) {
        let aps = notification.request.content.userInfo["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        title = alert?["title"] as? String
        message = alert?["body"] as? String
    }
}

//
//  NotificationsService.swift
//  away
//
//  Created by Дмитрий Пантелеев on 23.06.2024.
//

import UIKit

// MARK: - NotificationCenter Wrapper
@discardableResult
func when(_ name: Notification.Name, _ closure: @escaping NotificationClosure) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil) { notification in
        closure(notification)
    }
}

public func notify(_ event: Notification.Name, on object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
    NotificationCenter.default.post(Notification(name: event, object: object, userInfo: userInfo))
}


// MARK: - Notifications
extension Notification.Name {
    static let appWillEnterForeground = UIApplication.willEnterForegroundNotification
}

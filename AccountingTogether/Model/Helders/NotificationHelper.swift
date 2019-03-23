//
//  NotificationHelper.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationHelper{
    let content: UNMutableNotificationContent
    var trigger: UNTimeIntervalNotificationTrigger?
    var request: UNNotificationRequest?
    let identifier: String
    
    static func authorizeNotification(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {(success, error) in
        })
    }
    
    init(type: TypeNotification){
        var title: String
        var subtitle: String
        var body: String
        switch type {
        case .Trip:
            title = "Trip"
            subtitle = ""
            body = "It's almost time to leave!"
        }
        self.content = UNMutableNotificationContent()
        self.content.title = title
        self.content.subtitle = subtitle
        self.content.body = body
        self.identifier = UUID().uuidString
        self.content.badge = 1
    }
    func setTime(timeInterval: TimeInterval){
        self.trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        self.request = UNNotificationRequest(identifier: self.identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request!, withCompletionHandler: nil)
    }
    
}

enum TypeNotification{
    case Trip
}


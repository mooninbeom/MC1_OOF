//
//  NotificationManager.swift
//  OOF
//
//  Created by 문인범 on 3/26/24.
//

import Foundation
import UserNotifications




class NotificationManager {
    
    static let shared = NotificationManager()
    
    public func scheduleNotification(startDate: Date, endDate: Date, interval: Int, tripName: String) {
        let date = Date()
        let calendar = Calendar.current
        
        let content = UNMutableNotificationContent()
        content.title = tripName
        content.subtitle = "기록할 시간이에요!"
        content.sound = .default
        content.body = "지금 들어와 기록을 시작하세요!"
        
        let nowTime = calendar.component(.hour, from: date) * 3600 + calendar.component(.minute, from: date) * 60 + calendar.component(.second, from: date)
        
        var startTime = startDate.timeIntervalSinceNow - Double(nowTime)
        var endTime = endDate.timeIntervalSinceNow - Double(nowTime)
        
        if calendar.component(.day, from: startDate) == calendar.component(.day, from: endDate) {
//            print(endDate.getDateString())
            endTime = endTime + 3600*24
            
//            print(startTime)
//            print(endTime)
        }
        
        while startTime <= endTime {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: startTime, repeats: false)
            let request = UNNotificationRequest(identifier: "test", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("노티피케이션 등록 실패: \(error.localizedDescription)")
                } else {
                    print("등록 성공")
                }
            }
            print(startTime)
            startTime = startTime + Double(interval * 3600)
        }
        
        
        
    }
}

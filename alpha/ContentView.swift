//
//  ContentView.swift
//  alpha
//
//  Created by addin on 18/12/20.
//

import UserNotifications
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("reditugo")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("send noti") {
                let content = UNMutableNotificationContent()
                content.title = "kasih makan kucing"
                content.subtitle = "keknya dah laper"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

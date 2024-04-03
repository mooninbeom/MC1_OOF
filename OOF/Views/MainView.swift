//
//  ContentView.swift
//  OOF
//
//  Created by 문인범 on 3/23/24.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    @State var isSideMenuPresented: Bool = false
    @State var selectedSideMenuTab: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                HomeView(presentSideMenu: $isSideMenuPresented)
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
                
                ArchiveView(isMenuViewPresent: $isSideMenuPresented, isLogoButtonTapped: $selectedSideMenuTab)
                    .tag(1)
                    .toolbar(.hidden, for: .tabBar)

                RegisterRecordedSoundView(isMenuViewPresent: $isSideMenuPresented)
                    .tag(2)
                    .toolbar(.hidden, for: .tabBar)
                
                ShareMapView(presentSideMenu: $isSideMenuPresented)
                    .tag(3)
                    .toolbar(.hidden, for: .tabBar)

            }
            
            SideMenu(isShowing: $isSideMenuPresented, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $isSideMenuPresented)))
        }
        .tint(.orange)
        .onAppear {
            AVAudioApplication.requestRecordPermission { success in
                if success {
                    print("Permission granted")
                } else {
                    print("Permission denied")
                }
            }
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, _ in
                if success {
                    print("Notification granted")
                } else {
                    print("Notification denied")
                }
            }
        }
    }
}

#Preview {
    MainView()
}

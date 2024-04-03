//
//  HomeWillStartView.swift
//  OOF
//
//  Created by 문인범 on 3/25/24.
//

import SwiftUI

struct HomeWillStartView: View {
    @Binding var isAnimating: Bool
    var trip: Trip
    
    var body: some View {
        VStack {
            HStack {
                Text(firstText())
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                Spacer()
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("시작 날짜: " + secondText())
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                Spacer()
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("종료 날짜: " + thirdText())
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
    }
    
    private func firstText() -> String {
        let nowDate = Date()
        let startDate = self.trip.startDate!
        let endDate = self.trip.endDate!
        
        if startDate > nowDate {
            return "진행 예정중인 여행"
        }
        
        if startDate <= nowDate && nowDate <= endDate {
            isAnimating = true
            return "진행중인 여행"
        }
        
        return "종료된 여행"
    }
    
    private func secondText() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let result = formatter.string(from: trip.startDate!)
        return result
    }
    
    private func thirdText() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let result = formatter.string(from: trip.endDate!)
        return result
    }
}







//#Preview {
//    HomeWillStartView()
//}

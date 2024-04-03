import SwiftUI




struct ConfirmTripView: View {
    @Binding var progressStatus: ProgressStatus
    @Binding var progress: Double
    var selectedStartDate: Date
    var selectedEndDate: Date
    var hourValue: Int
    var secondValue: Int
    var selectedTripName: String
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("여행 시작 날짜")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                Text("\(dateFormatter.string(from: self.selectedStartDate))")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
            }
            .padding()
            
            HStack {
                Text("여행 종료 날짜")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                Text("\(dateFormatter.string(from: self.selectedEndDate))")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
            }
            .padding()
            
            HStack {
                Text("기록 주기")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                Text("\(hourValue) 시간마다 \(secondValue) 초씩")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            }
            .padding()
            
            Text(selectedTripName)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            
            HStack(spacing: 20) {
                Button {
                    withAnimation {
                        progressStatus = .selectTripName
                        progress = 0.6
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.red)
                        .frame(width: 100, height: 50)
                        .overlay {
                            Text("수정하기")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                }
                
                Button {
                    withAnimation {
                        progressStatus = .success
                        progress = 1
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100, height: 50)
                        .overlay {
                            Text("저장")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                }
            }
            .padding()
            
            Spacer()
            
        }
    }
}



#Preview {
    ConfirmTripView(progressStatus: .constant(.confirm), progress: .constant(0.75), selectedStartDate: Date(), selectedEndDate: Date(), hourValue: 1, secondValue: 15, selectedTripName: "당신의 멋진 여행")
}

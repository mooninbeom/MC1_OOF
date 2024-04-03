import SwiftUI






struct TimeIntervalView: View {
    @Binding var progressStatus: ProgressStatus
    @Binding var progress: Double
    @Binding var hourValue: Int
    @Binding var secondValue: Int
    
    
    
    var body: some View {
        VStack {
            
            
            HStack {
                Text("\(hourValue)시간 마다")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                
                Stepper {
                    
                } onIncrement: {
                    hourValue += 1
                    if hourValue > 6 {
                        hourValue = 1
                    }
                } onDecrement: {
                    hourValue -= 1
                    if hourValue < 1 {
                        hourValue = 6
                    }
                }
                .labelsHidden()
                .padding()
            }
            .padding()
            
            HStack {
                Text("\(secondValue)초 씩 ")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                
                Stepper(value: $secondValue, in: 15...60, step: 15) {}
                    .labelsHidden()
                    .padding()
            }
            .padding()
            
            Text("녹음을 진행합니다!")
                .font(.system(size: 25, weight: .semibold, design: .rounded))
                .padding()
            
            
            HStack(spacing: 20) {
                Button {
                    withAnimation {
                        progressStatus = .selectEndDate
                        progress = 0.2
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.red)
                        .frame(width: 100, height: 50)
                        .overlay {
                            Text("뒤로가기")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                }
                
                Button {
                    withAnimation(.easeInOut) {
                        self.progressStatus = .selectTripName
                        self.progress = 0.6
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100, height: 50)
                        .overlay {
                            Text("완료")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                }
            }
            
            Spacer()
            
        }
    }
}



//#Preview {
//    TimeIntervalView(progressStatus: .constant(.selectInterval), progress: .constant(0.7))
//}

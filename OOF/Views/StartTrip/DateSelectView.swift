import SwiftUI




struct DateSelectView: View {
    @Binding var progressStatus: ProgressStatus
    @Binding var selectedStartDate: Date
    @Binding var selectedEndDate: Date
    @Binding var progress: Double
    
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("여행 시작 날짜를 선택해주세요!")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundStyle(
                            (progressStatus == .selectStartDate) ? .black : .gray
                        )
                        .frame(width: 120)
                    
                    DatePicker("", selection: $selectedStartDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .disabled((progressStatus != .selectStartDate))
                        .transformEffect(.init(scaleX: 0.7, y: 0.7))
                    
                }
                .offset(x: 50)
                .padding()
                
                if progressStatus == .selectStartDate {
                    Button {
                        withAnimation(.easeInOut) {
                            self.progressStatus = .selectEndDate
                            self.progress = 0.2
                        }
                        self.progressStatus = .selectEndDate
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
            }
            
            if progressStatus == .selectEndDate {
                VStack {
                    HStack {
                        Text("여행 종료 날짜를 선택해주세요!")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .frame(width: 120)

                        
                        DatePicker("", selection: $selectedEndDate, in: selectedStartDate..., displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.wheel)
                            .transformEffect(.init(scaleX: 0.7, y: 0.7))
                        
                    }
                    .offset(x: 50)
                    .padding()
                    
                    HStack(spacing: 20) {
                        
                        Button {
                            withAnimation {
                                progressStatus = .selectStartDate
                                progress = 0
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
                                self.progressStatus = .selectInterval
                                self.progress = 0.4
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
                    
                    
                }
            }
            
            Spacer()
        }
    }
}

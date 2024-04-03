import SwiftUI





struct TripSuccessView: View {
    @Binding var isPresented: Bool
    @Binding var progressStatus: ProgressStatus
    @Binding var progress: Double
    @Binding var isTripConfirmed: Bool
    
    var body: some View {
        VStack {
            Text("즐거운 여행을 보내세요!")
                .font(.system(size: 25, weight: .semibold, design: .rounded))
                .padding()

            Text("기록은 저희가 하겠습니다😄")
                .font(.system(size: 25, weight: .semibold, design: .rounded))
                .padding()
            
            Button {
                isTripConfirmed = true
                isPresented.toggle()
            } label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 100, height: 50)
                    .overlay {
                        Text("완료")
                            .foregroundStyle(.white)
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                    }
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

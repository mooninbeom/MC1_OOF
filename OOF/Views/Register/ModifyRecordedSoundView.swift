import SwiftUI


struct ModifyRecordedSoundView: View {
    @State private var contentText: String = ""
    @Binding var isPresented: Bool
    
    
    @State var record: Record
    var locationString: String = "대한민국, 대구광역시, 달서구"
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter
    }()
    
 
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                Text(locationString)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                
                Text(formatter.string(from: record.date!))
                
                Capsule()
                    .frame(width: 250, height: 50)
                
                TextField("10자 이내로 입력하세용~", text: $contentText)
                    .frame(width: 300, height: 80)
                    .font(.system(size: 18, design: .rounded))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray.opacity(0.3))
                    }
                
                Button {
                    TripDAO.shared.modifyRecord(record: &record, text: contentText)
                    
                    isPresented.toggle()
                } label: {
                    Text("확인")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                        }
                }
            }
        }
//        .frame(width: .infinity, height: .infinity)
    }
}



//#Preview {
//    ModifyRecordedSoundView(isPresented: .constant(true))
//}

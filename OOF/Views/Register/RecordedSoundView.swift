import SwiftUI



struct RecordedSoundView: View {
    @State var isPresented: Bool = false
    var record: Record
//    var fileName: String = "2023/12/25 핀란드에서,,"
    

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter
    }()
    
    
    var body: some View {
        HStack {
            Text(dateFormatter.string(from: record.date!))
//                .padding()
        
            Spacer()
            
            Capsule()
                .frame(width: 80, height: 30)
            
            Image(systemName: "chevron.right")
                .padding(.trailing, 10)
            
        }
        .padding()
        .background {
            Capsule()
                .foregroundStyle(.orange.opacity(0.5))
        }
        .onTapGesture {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            ModifyRecordedSoundView(isPresented: $isPresented, record: record)
        }
        .background(.clear)
//        .frame(maxWidth: .infinity)
        
    }
    
    

}


//#Preview {
//    RecordedSoundView()
//}

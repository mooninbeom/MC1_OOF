import SwiftUI





struct RegisterRecordedSoundView: View {
    @Environment(\.managedObjectContext) var managedObject
    @State var remaindCount: Int = 23
    @Binding var isMenuViewPresent: Bool
    
    @FetchRequest(
        entity: Record.entity(),
        sortDescriptors: [.init(keyPath: \Record.date, ascending: true)],
        predicate: NSPredicate(format: "modified == false"))
    var records: FetchedResults<Record>

    var body: some View {
        ZStack {
            VStack {
                TopLogoView(presentSideMenu: $isMenuViewPresent)
                
                
                Text("현재 \(records.count)개의 추억이 당신을 기다리고 있어요!")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                registerList()
                .background(.yellow.opacity(0.01))
                .scrollContentBackground(.hidden)
//                Spacer()
            }
        }
//        .frame(width: .infinity, height: .infinity)
        .background(.yellow.opacity(0.1))
        .onAppear {
            remaindCount = records.count
        }
    }
    
    @ViewBuilder
    private func registerList() -> some View {
        List {
            ForEach(self.records) { record in
                RecordedSoundView(record: record)
                    .listRowBackground(Color.clear)
            }
        }
        .background(.yellow.opacity(0.01))
        .scrollContentBackground(.hidden)
    }
}



//#Preview {
//    let context = PersistentController.shared.container.viewContext
//    
//    return RegisterRecordedSoundView(isMenuViewPresent: .constant(false))
//        .environment(\.managedObjectContext, context)
//}

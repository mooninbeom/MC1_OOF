import SwiftUI


struct ArchiveView: View {
    @Environment(\.managedObjectContext) var managedObject
    @State var isPresented: Bool = false
    @State var record: Record?
    @Binding var isMenuViewPresent: Bool
    @Binding var isLogoButtonTapped: Int
    @Namespace var namespace
    
    
    @FetchRequest(
        entity: Trip.entity(),
        sortDescriptors: [.init(keyPath: \Trip.startDate, ascending: false)])
    var trips: FetchedResults<Trip>
    
    let row = [ GridItem(.fixed(50))]
    
    var body: some View {
        ZStack {
            VStack {
                TopLogoView(presentSideMenu: $isMenuViewPresent)
                
                if trips.isEmpty {
                    Text("보관함이 비어있습니다😢")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
                
                ScrollView {
                    VStack {
                        ForEach(trips) { trip in
                            HStack {
                                Text(trip.tripName ?? "unknown 여행")
                                    .font(.system(size: 30, weight: .bold))
                                Spacer()
                            }
                            .padding()
                            
                            
                            ScrollView(.horizontal){
                                HStack {
                                    makeRecordsView(trip.records!)
                                }
                            }
                            .frame(height: 150)
                        }
                        
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .blur(radius: isPresented ? 10 : 0)
        }
//        .frame(width: .infinity, height: .infinity)
        .toolbar(.hidden, for: .tabBar)
        .overlay {
            if isPresented {
                TripContentView(isPresented: $isPresented, record: $record, namespace: namespace)
            }
        }
    }
    
    @ViewBuilder
    private func makeRecordsView(_ records: NSSet) -> some View {
        let recordsArray = records.allObjects as? [Record]

        ForEach(recordsArray!) { record in
            
            VStack {
                ArchiveMapSnapshotView(lat: record.lat, lng: record.lng, namespace: namespace)

                Text(record.text!)
            }
            .padding()
            .onTapGesture {
                withAnimation(.spring) {
                    self.record = record
                    isPresented.toggle()
                }
            }
        }
    }
    
    
    
}



#Preview {
    let managedObject = PersistentController.shared.container.viewContext
    
    return ArchiveView(isMenuViewPresent: .constant(false), isLogoButtonTapped: .constant(1))
        .environment(\.managedObjectContext, managedObject)
}

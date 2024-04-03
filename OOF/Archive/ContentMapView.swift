import SwiftUI



struct ContentMapView: View {
    
    let gradient = LinearGradient(colors: [.white, .clear], startPoint: .bottom, endPoint: .center)
    
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.brown)
                .overlay {
                    gradient
                }
//                .frame(maxHeight: 500)
            
        }
    }
}


//#Preview {
//    ContentMapView()
//}

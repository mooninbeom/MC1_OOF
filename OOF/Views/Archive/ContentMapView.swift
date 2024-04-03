import SwiftUI



struct ContentMapView: View {
    
    let gradient = LinearGradient(colors: [.white, .clear], startPoint: .bottom, endPoint: .center)
//    let namespace: Namespace.ID
    
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.brown)
                .overlay {
                    gradient
                }
                .frame(width: 300, height: 300)
            
        }
    }
}


//#Preview {
//    ContentMapView()
//}

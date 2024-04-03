//
//  ShareMapView.swift
//  OOF
//
//  Created by 문인범 on 3/27/24.
//

import SwiftUI
import MapKit

struct ShareMapView: View {
    @Environment(\.managedObjectContext) var managedObject
    @State private var presentDetailView: Bool = false
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .region(.init(center: .init(latitude: 35.8184, longitude: 128.5321), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))))
    @State private var selectedRecord: Record?
    
    @FetchRequest(
        entity: Record.entity(),
        sortDescriptors: [.init(keyPath: \Record.date, ascending: true)],
        predicate: .init(format: "modified == true"))
    var fetchResult: FetchedResults<Record>
    
    @Binding var presentSideMenu: Bool
    
    @Namespace var nothing
    
    var body: some View {
        ZStack {
            
            
//            Map(initialPosition: .camera(.init(centerCoordinate: .init(latitude: 37.7749, longitude: -122.4194), distance: 50000)))
            
            Map(position: $cameraPosition) {
//                Marker("어딜까요", coordinate: .init(latitude: 35.8184, longitude: 128.5321))
                
                ForEach(fetchResult) { record in
                    Annotation(record.text!, coordinate: .init(latitude: record.lat, longitude: record.lng)) {
                        Image(systemName: "paperplane.circle")
                            .resizable()
                            .foregroundStyle(.orange)
                            .frame(width: 30, height: 30)
                            .onTapGesture {
                                selectedRecord = record
                                withAnimation {
                                    presentDetailView = true
                                }
                            }
                        
                        
                    }
                }
                
                
            }
                
            
            VStack {
                TopLogoView(presentSideMenu: $presentSideMenu)
                Spacer()
            }
            
        }
        .blur(radius: presentDetailView ? 10 : 0)
        .overlay {
            if presentDetailView {
                TripContentView(isPresented: $presentDetailView, record: $selectedRecord, namespace: nothing)
            }
        }
    }
}

#Preview {
    let managedObject = PersistentController.shared.container.viewContext
    
    return ShareMapView(presentSideMenu: .constant(false))
        .environment(\.managedObjectContext, managedObject)
}

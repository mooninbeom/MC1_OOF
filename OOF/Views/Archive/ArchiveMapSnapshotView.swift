//
//  ArchiveMapSnapshotView.swift
//  OOF
//
//  Created by 문인범 on 3/24/24.
//

import SwiftUI

struct ArchiveMapSnapshotView: View {
    var lat: Double
    var lng: Double
    @State var image: UIImage?
    let namespace: Namespace.ID
    
    var body: some View {
        ZStack {
            if let image = self.image {
                Image(uiImage: image)
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .fill(.white)
                            .frame(width: 14, height: 14)
                            .overlay {
                                Circle()
                                    .fill(.orange)
                                    .frame(width: 10, height: 10)
                                
                            }
                    }
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundStyle(.brown)
                    }
//                    .matchedGeometryEffect(id: "map", in: namespace)

                    
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: 120, height: 120)
            }
        }
        .onAppear {
            generateSnapshot()
        }
    }
    
    
    private func generateSnapshot() {
        let snapshot = TripDAO.shared.makeMapSnapshot(lat: self.lat, lng: self.lng)
        
        snapshot.start { snapshot, error in
            if let error = error {
                print("지도 생성 오류: \(error.localizedDescription)")
                return
            }
            
            if let snapshot = snapshot {
                self.image = snapshot.image
            }
            
        }
    }
}

//#Preview {
//    ArchiveMapSnapshotView(lat: 36.0135, lng: 129.3263)
//}

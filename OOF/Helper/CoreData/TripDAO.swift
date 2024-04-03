//
//  TripDAO.swift
//  OOF
//
//  Created by 문인범 on 3/26/24.
//

import MapKit



struct TripDAO {
    static let shared = TripDAO()
    let tripEntityName = "Trip"
    let voiceEntityName = "Voice"
    
    private let context = PersistentController.shared.container.viewContext
    
    
    
    
    
    // 녹음된 소리 등록 과정
    public func modifyRecord(record: inout Record, text: String) {
        record.text = text
        record.modified = true
        
//        self.saveContext()
    }
    
    
    

    
    public func makeMapSnapshot(lat: Double, lng: Double) -> MKMapSnapshotter {
        let option: MKMapSnapshotter.Options = .init()
        
        option.region = .init(center: .init(latitude: lat, longitude: lng), span: .init(latitudeDelta: 0.03, longitudeDelta: 0.03))
        option.size = .init(width: 120, height: 120)
        option.mapType = .standard
        
        let snapshot = MKMapSnapshotter(options: option)
        
        return snapshot
    }
    
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("저장 오류! : \(error.localizedDescription)")
            }
        } else {
            print("변화 상황이 없습니다!")
        }
    }
    
    
    
    public func getSampleData() {
        let sampleData = Trip(context: context)
        let sampleRecord = Record(context: context)
        
        sampleData.tripName = "간지나는 여행"
        sampleData.startDate = Date().addingTimeInterval(-1000000)
        sampleData.endDate = Date().addingTimeInterval(-2000000)
        
        sampleRecord.modified = false
        sampleRecord.url = "nil"
        sampleRecord.lat = 36.0135
        sampleRecord.lng = 129.3263
        sampleRecord.date = Date().addingTimeInterval(-1000000 + 10000)
        sampleRecord.text = "멋진 여행이었다!"
        sampleRecord.bookmark = false
        sampleRecord.selectedTrip = sampleData
        
//        let sampleData2 = Trip(context: context)
        let sampleRecord2 = Record(context: context)
        
//        sampleData2.tripName = "간지나는 여행"
//        sampleData2.startDate = Date()
//        sampleData2.endDate = Date()
        
        sampleRecord2.modified = true
        sampleRecord2.url = "nil"
        sampleRecord2.lat = 35.8184
        sampleRecord2.lng = 128.5321
        sampleRecord2.date = Date().addingTimeInterval(-1000000 + 20000)
        sampleRecord2.text = "별루 여행이었다ㅜ"
        sampleRecord2.bookmark = false
        sampleRecord2.selectedTrip = sampleData
        
        let sampleRecord3 = Record(context: context)
        
        sampleRecord3.modified = true
        sampleRecord3.url = "nil"
        sampleRecord3.lat = 37.7749
        sampleRecord3.lng = -122.4194
        sampleRecord3.date = Date().addingTimeInterval(-1000000 + 50000)
        sampleRecord3.text = "샌프란"
        sampleRecord3.bookmark = false
        sampleRecord3.selectedTrip = sampleData
        
    }
}



extension TripDAO {
    public func tripComfirm(startDate: Date, endDate: Date, interval: Int, recordLength: Int, tripName: String) {
        let trip = Trip(context: self.context)
        
        trip.startDate = startDate
        trip.endDate = endDate
        trip.interval = Int16(interval)
        trip.recordLength = Int16(recordLength)
        trip.tripName = tripName
        
//        NotificationManager.shared.scheduleNotification(startDate: startDate, endDate: endDate, interval: interval,tripName: tripName)
        
    }
    
    
    
}

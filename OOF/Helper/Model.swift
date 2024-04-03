import SwiftUI
import MapKit





struct VoiceMemo {
    var recordedDate: Date
    var recordedURL: URL
    
    var bookmarked: Bool = false
    var isModified: Bool
    
    var location: CLLocationCoordinate2D?
    var memoText: String?
}

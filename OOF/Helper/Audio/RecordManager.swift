//
//  RecordManager.swift
//  OOF
//
//  Created by 문인범 on 3/25/24.
//

import AVFoundation




class RecordManager: NSObject, AVAudioRecorderDelegate {
    static let shared = RecordManager()
    
    private var recorder: AVAudioRecorder?
    
    var isRecord: Bool = false
}


extension RecordManager {
    public func startRecord() {
        let fileURL = getDirectoryURL().appendingPathComponent("\(Date().getDateString()).m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            try self.recorder = AVAudioRecorder(url: fileURL, settings: settings)
            self.recorder?.record()
            self.isRecord = true
            
        } catch {
            print("녹음 시작 오류: \(error.localizedDescription)")
        }
        
    }
    
    
    
    
    
    private func getDirectoryURL() -> URL {
        let fileManager = FileManager.default
        let result = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return result
    }
}












// MARK: - 날짜 String 변환
extension Date {
    func getDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd|HH:mm"
        
        let result = formatter.string(from: self)
        return result
    }
}

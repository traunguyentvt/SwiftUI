//
//  ReadingListViewModel.swift
//  WKWebView
//
//  Created by VT on 7/31/23.
//

import Foundation

class ReadingListViewModel: ObservableObject {
    @Published var readingData: [ReadingData] = []
    
    private var fileURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("readingData.json")
    }
    
    init() {
        load()
    }
    
    private func load() {
        do {
            let data = try Data(contentsOf: fileURL)
            readingData = try JSONDecoder().decode([ReadingData].self, from: data)
        } catch {
            print("Error loading reading data \(error)")
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(readingData)
            try data.write(to: fileURL)
        } catch {
            print("Error saving reading data \(error)")
        }
    }
    
    func add(_ url: URL, title: String) {
        let newReadingData = ReadingData(url: url, title: title, creationDate: Date(), hasFinishedReading: false)
        readingData.append(newReadingData)
        save()
    }
    
    func remove(_ data: ReadingData) {
        if let index = readingData.firstIndex(of: data) {
            readingData.remove(at: index)
            save()
        }
    }
}

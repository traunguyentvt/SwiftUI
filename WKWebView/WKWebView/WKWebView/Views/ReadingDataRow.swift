//
//  ReadingDataRow.swift
//  WKWebView
//
//  Created by VT on 7/31/23.
//

import SwiftUI

struct ReadingDataRow: View {
    let readingData: ReadingData
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: readingData.hasFinishedReading ? "book.fill" : "book")
                .foregroundColor(.green)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(readingData.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.red)
                
                Text(readingData.creationDate, format: .dateTime.day().month().year())
                    .font(.body)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
    }
}

struct ReadingDataRow_Previews: PreviewProvider {
    static var previews: some View {
        ReadingDataRow(readingData: ReadingData.createExamples())
    }
}

//
//  CertificateRow.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct CertificateRow: View {
    
    var certificates: [Certificate] = Certificate.certificateData()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Certificates")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.leading, 60)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    ForEach(certificates) { certificate in
                        CertificateView(certificate: certificate)
                    }
                }
                .padding(.trailing, 20)
                .padding(.leading, 30)
                .padding(.bottom, 20)
                .padding(.top, 10)
            }
        }
    }
}

struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}

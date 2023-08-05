//
//  CertificateView.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct CertificateView: View {
    
    var certificate: Certificate = Certificate(title: "UI Design", image: "Certificate1", width: 340, height: 220)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(certificate.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    
                    Text("Certificate")
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Image(certificate.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: certificate.width, height: certificate.height)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView(certificate: Certificate.certificateData()[0])
    }
}

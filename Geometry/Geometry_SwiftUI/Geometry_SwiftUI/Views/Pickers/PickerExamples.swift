//
//  PickerExamples.swift
//  Geometry_SwiftUI
//
//  Created by VT on 7/26/23.
//

import SwiftUI

struct PickerExamples: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Pick something")
                .font(.title)
            
//            CirclePicker()
            SliderPicker()
            
            Text("@Namespace creates an animation namespace to allow matched geometry effects, which can be shared by other views. This owns its data. @NSApplicationDelegateAdaptor is used to create and register a class as the app delegate for a macOS app.")
                .font(.footnote)
            
            CalenderView()
        }
        .padding()
    }
}

struct PickerExamples_Previews: PreviewProvider {
    static var previews: some View {
        PickerExamples()
    }
}

//
//  UpdateStore.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import Combine
import SwiftUI

class UpdateStore: ObservableObject {
//    var willChange = PassthroughSubject<UpdateStore, Never>()
    
    //use @Published to notify the view updating
    @Published var updateList: [UpdatedCourse]
//    {
//        didSet {
//            willChange.send(self)
//        }
//    }
    
    init() {
        updateList = UpdatedCourse.updatedCourseData()
    }
}

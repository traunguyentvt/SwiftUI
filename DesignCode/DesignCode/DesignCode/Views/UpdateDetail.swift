//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct UpdateDetail: View {
    
    var course: UpdatedCourse
    
    var body: some View {
        VStack(spacing: 20) {
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Image(course.image)
                .resizable()
                .frame(height: 200)
                .aspectRatio(contentMode: .fit)
            
            Text(course.text)
                .lineLimit(nil)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail(course: UpdatedCourse.updatedCourseData()[0])
    }
}

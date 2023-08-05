//
//  CourseView.swift
//  DesignCode
//
//  Created by VT on 8/4/23.
//

import SwiftUI

struct CourseView: View {
    
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(5)
            
            Spacer()
            
            Image(course.image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(course.color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: course.shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: Course.courseData()[0])
    }
}

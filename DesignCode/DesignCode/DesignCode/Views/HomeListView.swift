//
//  HomeListView.swift
//  DesignCode
//
//  Created by VT on 8/3/23.
//

import SwiftUI

struct HomeListView: View {
    
    @State var showContent = false
    var courses: [Course] = Course.courseData()
    var isShown: Bool
    
    //GeometryReader is a view in SwiftUI that allows you to get the size of the view, which can be very useful for verious tasks, such as positioning other view within it.
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Text("22 Courses")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding(.leading, 60)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 30) {
                        ForEach(courses) { course in
                            Button(action: {
                                if isShown {
                                    showContent.toggle()
                                }
                            }) {
                                GeometryReader { geometry in
                                    CourseView(course: course)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10, z: 0))
                                        .sheet(isPresented: $showContent) {
                                            if isShown {
                                                ContentView()
                                            }
                                        }
                                }
                                .frame(width: 246, height: 360)
                            }
                            
                        }
                    }
                    .padding(.leading, 30)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
                
                CertificateRow()
            }
            .padding(.top, 78)
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var isShown = true
    static var previews: some View {
        HomeListView(isShown: isShown)
    }
}

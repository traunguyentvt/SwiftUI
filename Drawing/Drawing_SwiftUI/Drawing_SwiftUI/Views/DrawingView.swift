//
//  DrawingView.swift
//  Drawing_SwiftUI
//
//  Created by VT on 7/24/23.
//

import SwiftUI

struct DrawingView: View {
    
    @State private var selectedColor: Color = .black
    @State private var lines = [Line]()
    @State private var undoLines = [Line]()
    
    var body: some View {
        VStack {
            ColorPickerView(selectedColor: $selectedColor)
            
            Canvas { context, size in
                for line in lines {
                    let path = createPath(for: line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: 4)
                }
            }
            .gesture(DragGesture(minimumDistance: 0).onChanged({ value in
                if value.translation.width + value.translation.height == 0 {
                    //length of line is zero -> new line
                    lines.append(Line(points: [CGPoint](), lineWidth: 1, color: selectedColor))
                } else {
                    let index = lines.count - 1
                    lines[index].points.append(value.location)
                }
            }))
            
            HStack {
                Button {
                    let line = lines.remove(at: lines.count-1)
                    undoLines.append(line)
                } label: {
                    Image(systemName: "chevron.backward.square.fill")
                        .imageScale(.large)
                    Text("Undo")
                }
                .disabled(lines.count == 0)
                .foregroundColor(.blue)
                
                Button {
                    let line = undoLines.removeLast()
                    lines.append(line)
                } label: {
                    Image(systemName: "chevron.forward.square.fill")
                        .imageScale(.large)
                    Text("Redo")
                }
                .disabled(undoLines.count == 0)
                .foregroundColor(.red)
                
                Spacer()
                
                Button("Delete", role: .destructive) {
                    lines.removeAll()
                    undoLines.removeAll()
                }
            }
            .padding()
        }
    }
    
    func createPath(for lines: [CGPoint]) -> Path {
        var path = Path()
        if let firstPoint = lines.first {
            path.move(to: firstPoint)
        }
        if lines.count > 2 {
            for index in 1..<lines.count {
                let mid = calculateMidPoint(point1: lines[index-1], point2: lines[index])
                path.addQuadCurve(to: mid, control: lines[index-1])
            }
        }
        if let lastPoint = lines.last {
            path.addLine(to: lastPoint)
        }
        return path
    }
    
    func calculateMidPoint(point1: CGPoint, point2: CGPoint) -> CGPoint {
        return CGPoint(x: (point1.x+point2.x)/2, y: (point1.y+point2.y)/2)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}

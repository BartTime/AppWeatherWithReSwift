import SwiftUI
import UIKit

struct WaveView: View {
    let dayColor: Color
    let nightColor: Color
    let sunColor: Color
    let horizontColor: Color
    let waveStrokeWidth = 4.0
    let horizontalStrokeWidth = 1.0
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Wave()
                    .stroke(nightColor, lineWidth: waveStrokeWidth)
                
                Wave()
                    .stroke(dayColor, lineWidth: waveStrokeWidth)
                    .mask {
                        GeometryReader { innerProxy in
                            Rectangle().foregroundColor(.red)
                                .frame(width: innerProxy.size.width,
                                       height: innerProxy.size.height / 2.0)
                        }
                }
                        
                Rectangle()
                    .foregroundColor(horizontColor)
                    .frame(height: horizontalStrokeWidth)
                    .position(CGPoint(x: proxy.size.width/2.0, y: proxy.size.height/2.1))
                    .shadow(color: .gray.opacity(0.3), radius: 2.0)
                        
                Circle()
                    .frame(width: 15)
                    .foregroundColor(sunColor)
                    .shadow(color: sunColor, radius: 4.0)
                    .position(Wave.point(
                                for: proxy.size.width/3.0,
                                in: CGRect(origin: CGPoint.zero, size: proxy.size)))
                        
                    
            }


        }
    }
}

struct Wave: Shape {
    let resolution: Int = 10
    let amplitude: Int = 1
    
    static func point(for x: CGFloat, in rect: CGRect) -> CGPoint {
        let frequency = 1 * (2*3.1415)
        let waveLenght = rect.width / CGFloat(frequency)
        let relativeX = x / waveLenght
        let y = (cos(relativeX) * rect.height/2.2) + rect.midY
        return CGPoint(x: x, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        let frequency = 1 * (2 * 3.1415)
        let width = rect.width
        let waveLenght = rect.width / CGFloat(frequency)
        
        let startPoint = CGPoint(x: rect.minX, y: rect.midY)
        var path = UIBezierPath()
        
        path.move(to: startPoint)
        
        for x in stride(from: 0, through: width, by: 1) {
            let realitivyX = x/waveLenght
            let y = (cos(realitivyX) * rect.height/2.2) + startPoint.y
            let point = CGPoint(x: x, y: y)
            
            if x == 0 {
                path.move(to: point)
                continue
            }
            path.addLine(to: point)
        }
        return Path(path.cgPath)
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                WaveView(dayColor: .green, nightColor: .blue, sunColor: .yellow, horizontColor: .gray)
                WaveView(dayColor: .green, nightColor: .blue, sunColor: .yellow, horizontColor: .gray)
            }
            
        }
    }
}

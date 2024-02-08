//
//  LibraVIew.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/9/17.
//
//
//import Foundation
//import SwiftUI
//
//struct LibraView: View{
//    
//    
//    func getPercentage(geo:GeometryProxy )-> Double{
//        let maxDistance = UIScreen.main.bounds.width / 2
//        let currentX = geo.frame(in: .global).midX
//        return Double(1-(currentX/maxDistance))
//    }
//    
//    var body: some View{
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack{
//                ForEach(0..<20){ index in
//                    GeometryReader { geometry in
//                        RoundedRectangle(cornerRadius: 20)
//                            .rotation3DEffect(Angle(degrees: getPercentage(geo: geometry)*40),
//                                              axis: (x:0.0, y:1.0, z:0.0))
//                    }
//                    .frame(width:300, height: 250)
//                    .padding()
//                }
//            }
//        }
//    }
//    
//}
//
//struct LibraView_Previews: PreviewProvider {
//    static var previews: some View {
//        LibraView()
//    }
//}

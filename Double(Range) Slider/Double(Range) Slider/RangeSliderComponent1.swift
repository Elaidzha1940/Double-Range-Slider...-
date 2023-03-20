//
//  RangeSliderComponent1.swift
//  Double(Range) Slider
//
//  Created by Elaidzha Shchukin on 20.03.2023.
//

import SwiftUI

struct RangeSliderComponent1: View {
    
    var totalWidht = UIScreen.main.bounds.width - 80
    
    var body: some View {
        
        Slider1()
    }
}

struct SliderComponent_Previews: PreviewProvider {
    static var previews: some View {
        RangeSliderComponent1()
    }
}

struct Slider1 : View {
    
    @State var width: CGFloat = 0
    @State var width1:  CGFloat = 30
    var totalWidth = UIScreen.main.bounds.width - 80
     
    var right: String {
        
        let equal = self.width / self.totalWidth
        
        let rub = Int(equal / 000.001000)
        return "\(rub) р"
    }
    
    var left: String {
        
        let equal = self.width1 / self.totalWidth
        
        let rub = Int(equal / 0.0003000)
        return "\(rub) р"
        
    }

    var body: some View {
        
        VStack {
            HStack {
                Text("Ценовой диапазон")
                    .font(.headline)
                    .fontWeight(.bold)
                  
                Spacer()
                
                Text("\(right) - \(left)")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
    
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.brown)
                    .frame(height: 4)
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: self.width1 - self.width, height: 6)
                    .offset(x: self.width + 28)
                
                HStack(spacing: 0) {
                    
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 28, height: 28)
                        .offset(x: self.width)
                        .gesture(
                            
                            DragGesture()
                                .onChanged({ (value) in
                                    
                                    if value.location.x >= 0 && value.location.x <= self.width1 {
                                        self.width = value.location.x
                                    }
                                })
                        )
                    
                    Circle()
                        .fill(Color.brown)
                        .frame(width: 28, height: 28)
                        .offset(x: self.width1)
                        .gesture(
                            
                            DragGesture()
                                .onChanged({ (value) in
                                    
                                    if value.location.x <= self.totalWidth && value.location.x >= self.width {
                                        
                                        self.width1 = value.location.x
                                    }
                                    
                                })
                        )
                }
            }
        }
        .padding()
    }
}



struct Currecny: View {
    let price: Double = 1000
    
    var body: some View {
        Text(formatCurrency(price: price))
    }
    
    func formatCurrency(price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "р"
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: price)) ?? ""
    }
}

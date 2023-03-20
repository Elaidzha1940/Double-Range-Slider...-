//
//  ContentView.swift
//  Double(Range) Slider
//
//  Created by Elaidzha Shchukin on 20.03.2023.
//

import SwiftUI

struct SliderComponent2: View {
    
    var totalWidht = UIScreen.main.bounds.width - 80
    
    var body: some View {
        
        Slider2()
    }
}

struct SliderComponent2_Previews: PreviewProvider {
    static var previews: some View {
            SliderComponent2()
    }
}

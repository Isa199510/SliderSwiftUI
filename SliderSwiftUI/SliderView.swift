//
//  SliderView.swift
//  SliderUIKit1
//
//  Created by Иса on 25.12.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Float
    var alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged(_:)),
                         for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(
            red: 255,
            green: 0,
            blue: 0,
            alpha: CGFloat(alpha) / 100
        )
        uiView.setValue(Float(value), animated: true)
    }
    
    func makeCoordinator() -> SliderView.Coordinator {
        Coordinator(self)
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        var sliderView: SliderView
        
        init(_ sliderView: SliderView) {
            self.sliderView = sliderView
        }
        
        @objc func valueChanged(_ slider: UISlider) {
            sliderView.value = slider.value
        }
    }
}


struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50), alpha: 100)
    }
}

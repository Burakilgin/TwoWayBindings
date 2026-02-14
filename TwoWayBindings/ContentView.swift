//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Burak Ilgın on 14.02.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name: String = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    @State private var sliderValue = 50.0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Press Count: \(pressCount)")
            
            Button("Press Me") {
                pressCount = pressCount + 1
            }
            .buttonStyle(.glassProminent)
            
            Spacer()
            
            TextField("Enter a name: ", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Name Entered: \(name)")
            
            Spacer()
            
            Toggle("Toggle is \(toggleIsOn ? "on" : "off") :", isOn: $toggleIsOn)
            
            Spacer()
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            
            ColorPicker("Select Rectangle Color", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date: ", selection: $selectedDate)
            Text("Selected Date: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            
            Spacer()
            
            Stepper("Stepper Value: \(stepperValue)", value: $stepperValue, in: 1...10)
            
            Spacer()
            
            Slider(value: $sliderValue, in: 1...100) {
                //Accessibility Label
            } minimumValueLabel: {
                Image(systemName: "speaker.minus")
            } maximumValueLabel: {
                Image(systemName: "speaker.plus")
            }
            
            //Slider(value: $sliderValue, in: 0...100)
            //Text("Slider Value: \(sliderValue.formatted(.number.precision(.fractionLength(1))))")
            //Text("Slider Value: \(String(format: "%.1f", sliderValue))")
            Text("Slider Value: \(Int(sliderValue))")

            
            Spacer()
            
        }
        
        .font(.title2)
        .padding()
        
    }
}

#Preview {
    ContentView()
}

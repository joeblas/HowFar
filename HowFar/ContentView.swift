//
//  ContentView.swift
//  HowFar
//
//  Created by Joe Gallegos on 6/19/20.
//  Copyright © 2020 Joe Gallegos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var inputValue = ""
    @State private var outputUnit = 0
    @State private var outputValue = ""
    
    let units = ["meters", "feet", "yards", "miles"]
    let mappedUnit = [
        "meters": UnitLength.meters,
        "feet": UnitLength.feet,
        "yards": UnitLength.yards,
        "miles": UnitLength.miles
    ]
    var convertUnits: Double {
        let fromValue = Double(inputValue) ?? Double(0)
        let fromUnit = units[inputUnit]
        let mappedFromUnit = mappedUnit[fromUnit] ?? UnitLength.meters
        let fromDistance = Measurement(value: fromValue, unit: mappedFromUnit)
        
        let toUnit = units[outputUnit]
        let mappedToUnit = mappedUnit[toUnit] ?? UnitLength.meters
        
        let converted = fromDistance.converted(to: mappedToUnit)
        
        return Double(converted.value)
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField("Input Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("\(convertUnits, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("Distance Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}

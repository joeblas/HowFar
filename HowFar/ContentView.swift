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
            }
        .navigationBarTitle("Distance Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

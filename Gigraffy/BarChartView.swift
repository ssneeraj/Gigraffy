//
//  LineChart.swift
//  Gigraffy
//
//  Created by Neeraj Sharma on 11/6/20.
//

import SwiftUI

struct BarChartView: View {
    
    @StateObject var chartViewModel: ChartViewModel
    @State var pickerSelectedItem = 2
    
    var body: some View {
        
        ZStack {
            
            Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Steps")
                    .foregroundColor(.white)
                    .font(.system(size: 34))
                    .fontWeight(.medium)
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Day").tag(1)
                    Text("Week").tag(2)
                    Text("Month").tag(3)
                    Text("Year").tag(4)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                // Draw Bars
                HStack {
                    ForEach(chartViewModel.chartData) { data in
                        SingleBarView(xLabel: data.xLabel, value: chartViewModel.ratio(value: data.value))
                    }
                }
                .animation(.easeIn)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(chartViewModel: ChartViewModel())
    }
}

struct SingleBarView: View {
    
    var xLabel: String
    var value: CGFloat
    
    var body: some View {
        VStack{
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.08063012573, green: 0.2434819372, blue: 0.3373489538, alpha: 0.5205211901)))
                Capsule().frame(width: 30, height: 200 * value)
                    .foregroundColor(.white)
            }
            Text(xLabel)
                .foregroundColor(.white)
        }
    }
}

//
//  LineChart.swift
//  Gigraffy
//
//  Created by Neeraj Sharma on 11/6/20.
//

import SwiftUI

struct BarChartView: View {
    
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
      
                // Bar
                HStack {
                    SingleBarView(dayOfWeek: "Mon", stepsInADay: (1000/100))
                    SingleBarView(dayOfWeek: "Tue", stepsInADay: (15000/100))
                    SingleBarView(dayOfWeek: "Wed", stepsInADay: (20000/100))
                    SingleBarView(dayOfWeek: "Thu", stepsInADay: (1200/100))
                    SingleBarView(dayOfWeek: "Fri", stepsInADay: (8700/100))
                    SingleBarView(dayOfWeek: "Sat", stepsInADay: (20000/100))
                    SingleBarView(dayOfWeek: "Sun", stepsInADay: (12000/100))
                }
                
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}

struct SingleBarView: View {
    
    var dayOfWeek: String
    var stepsInADay: CGFloat

    var body: some View {
        VStack{
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                Capsule().frame(width: 30, height: stepsInADay)
                    .foregroundColor(.white)
            }
            Text(dayOfWeek)
                .foregroundColor(.white)
        }
    }
}

//
//  ChartViewModel.swift
//  Gigraffy
//
//  Created by Neeraj Sharma on 11/10/20.
//

import Foundation
import UIKit

class ChartViewModel: ObservableObject {

    @Published var chartData: [ChartDataPoint] = [ChartDataPoint(value: 1000, xLabel: "S", yLabel: ""),
                                                  ChartDataPoint(value: 2000, xLabel: "M", yLabel: ""),
                                                  ChartDataPoint(value: 3000, xLabel: "T", yLabel: ""),
                                                  ChartDataPoint(value: 4000, xLabel: "W", yLabel: ""),
                                                  ChartDataPoint(value: 5000, xLabel: "T", yLabel: ""),
                                                  ChartDataPoint(value: 100, xLabel: "F", yLabel: ""),
                                                  ChartDataPoint(value: 100, xLabel: "S", yLabel: "")
    ]
    
    init() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            
            var newChartData = [ChartDataPoint]()
            for chartDataPoint in self.chartData {
                var newChartDataPoint = chartDataPoint
                newChartDataPoint.value = chartDataPoint.value + 1
                newChartData.append(newChartDataPoint)
            }
            self.chartData = newChartData
            print("++++ Yay")
            
            
            
        }
    }

    func maxChartDataValue() -> CGFloat? {
        return chartData.compactMap { $0.value }.max()
    }
    
    func ratio(value: CGFloat) -> CGFloat {
        let max = maxChartDataValue() ?? 1
        let ratio = value / max
        return ratio
    }
}

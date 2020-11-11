//
//  ChartData.swift
//  Gigraffy
//
//  Created by Neeraj Sharma on 11/9/20.
//

import Foundation
import UIKit

struct ChartDataPoint: Identifiable {

    let id = UUID()
    var value: CGFloat
    var xLabel = ""
    var yLabel = ""

}

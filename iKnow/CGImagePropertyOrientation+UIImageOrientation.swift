//
//  CGImagePropertyOrientation+UIImageOrientation.swift
//  iKnow
//
//  Created by Shao-Wei Liang on 2018-01-22.
//  Copyright © 2018 Shao-Wei Liang. All rights reserved.
//

import Foundation
import ImageIO
import UIKit

extension CGImagePropertyOrientation{
    init(_ orientation: UIImageOrientation){
        switch orientation{
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .upMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        }
    }
}

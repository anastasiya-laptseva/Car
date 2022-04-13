//
//  MenuModel.swift
//  carHWalapteva
//
//  Created by Anastasiya Laptseva on 29.03.22.
//

import UIKit

enum MenuModel: Int, CustomStringConvertible {
    case ScoreLeft
    case ScoreRight
    case BestResult
    case Settings
    case Help
    case ClearAll
    
    var description: String {
        switch self {
        case .ScoreLeft: return "Left \(UserDefaults.standard.integer(forKey: "leftClick"))"
        case .ScoreRight: return "Right \(UserDefaults.standard.integer(forKey: "rightClick"))"
        case .BestResult: return "Best Result"
        case .Settings: return "Settings"
        case .Help: return "Help"
        case .ClearAll: return "ClearAll"
        }
    }
    var image: UIImage {
        switch self {
        case .ScoreLeft: return UIImage(named: "left") ?? UIImage()
        case .ScoreRight: return UIImage(named: "right") ?? UIImage()
        case .BestResult: return UIImage(named: "medal") ?? UIImage()
        case .Settings: return UIImage(named: "Settings") ?? UIImage()
        case .Help: return UIImage(named: "help") ?? UIImage()
        case .ClearAll: return UIImage(named: "trashBin") ?? UIImage()
        }
    }
}

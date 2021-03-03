//
//  Helpers.swift
//  IPL-Knockout!
//
//  Created by pranay chander on 03/03/21.
//

import Foundation

enum Levels: Int, CaseIterable {
    case qualifiers
    case quarterFinals
    case semiFinals
    case finals

    var navBarTitle: String {
        switch self {
        case .qualifiers:
            return "Qualifiers"
        case .quarterFinals:
            return "Quarter Finals"
        case .semiFinals:
            return "Semi Finals"
        case .finals:
            return "Finals"
        }
    }
}

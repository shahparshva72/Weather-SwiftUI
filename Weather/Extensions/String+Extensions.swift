//
//  String+Extensions.swift
//  Weather
//
//  Created by Parshva Shah on 8/17/20.
//  Copyright © 2020 Parshva Shah. All rights reserved.
//

import Foundation

extension String{
    func encoded() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}

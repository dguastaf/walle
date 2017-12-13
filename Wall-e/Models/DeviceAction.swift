//
//  DeviceAction.swift
//  Wall-e
//
//  Created by Doug Guastaferro on 12/2/17.
//  Copyright © 2017 Doug Guastaferro. All rights reserved.
//

import Foundation

struct DeviceAction {
    let iconName: String
    let actionParam: String
    
    init(iconName: String, actionParam: String) {
        self.iconName = iconName
        self.actionParam = actionParam
    }
}

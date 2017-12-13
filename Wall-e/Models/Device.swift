//
//  Device.swift
//  Wall-e
//
//  Created by Doug Guastaferro on 12/2/17.
//  Copyright © 2017 Doug Guastaferro. All rights reserved.
//

import Foundation

struct Device {
    let displayName: String
    let imageName: String
    let actions: [DeviceAction]
    let endpoint: String
    
    init(displayName: String,
         imageName: String,
         endpoint: String,
         actions: [DeviceAction]) {
        self.displayName = displayName
        self.imageName = imageName
        self.endpoint = endpoint
        self.actions = actions
    }
}

//
//  DeviceActionButton.swift
//  Wall-e
//
//  Created by Doug Guastaferro on 12/13/17.
//  Copyright © 2017 Doug Guastaferro. All rights reserved.
//

import Foundation
import UIKit

class DeviceActionButton : UIButton {
    let actionIndex: Int
    
    init(frame: CGRect, actionIndex: Int) {
        self.actionIndex = actionIndex
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        actionIndex = 0
        super.init(coder: coder)
    }
}

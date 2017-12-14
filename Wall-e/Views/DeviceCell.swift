//
//  DeviceCell.swift
//  Wall-e
//
//  Created by Doug Guastaferro on 12/2/17.
//  Copyright © 2017 Doug Guastaferro. All rights reserved.
//

import Foundation
import UIKit

class DeviceCell : UITableViewCell {
    private let ActionImagesLeftMargin:CGFloat = 25
    private let ActionImagesTopBottomPadding: CGFloat = 15
    
    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var deviceActionsView: UIScrollView!
    
    private weak var delegate: DeviceCellDelegate?
    
    override func prepareForReuse() {
        deviceImage.image = nil
    }
    
    func setupWithDevice(_ device: Device, delegate: DeviceCellDelegate) {
        self.delegate = delegate
        deviceImage.image = UIImage(named: device.imageName)
        
        var lastMargin: CGFloat = 0
        let height = deviceActionsView.frame.height - ActionImagesTopBottomPadding * 2
        
        for (i, deviceAction) in device.actions.enumerated() {
            let frame = CGRect(x: lastMargin + ActionImagesLeftMargin,
                               y: ActionImagesTopBottomPadding,
                               width: height,
                               height: height)
            lastMargin = frame.minX + frame.width
            let button = DeviceActionButton(frame: frame, actionIndex: i)
            button.addTarget(self, action: #selector(buttonActionTapped(_:)), for: .touchUpInside)
            
            let image = UIImage(named: deviceAction.iconName)
            button.setImage(image, for: .normal)
            deviceActionsView.addSubview(button)
        }
    }
    
    func buttonActionTapped(_ sender: DeviceActionButton) {
        delegate?.deviceActionTapped(cell: self, actionIndex: sender.actionIndex)
    }
}

protocol DeviceCellDelegate : class {
    func deviceActionTapped(cell: UITableViewCell, actionIndex: Int)
}

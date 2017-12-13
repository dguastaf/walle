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
    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var deviceActionsView: UIScrollView!
    
    private let ActionImagesLeftMargin:CGFloat = 25
    private let ActionImagesTopBottomPadding: CGFloat = 15
    
    override func prepareForReuse() {
        deviceImage.image = nil
    }
    
    func setupWithDevice(_ device: Device) {
        deviceImage.image = UIImage(named: device.imageName)
        
        var lastMargin: CGFloat = 0
        let height = deviceActionsView.frame.height - ActionImagesTopBottomPadding * 2
        
        for deviceAction in device.actions {
            let frame = CGRect(x: lastMargin + ActionImagesLeftMargin,
                               y: ActionImagesTopBottomPadding,
                               width: height,
                               height: height)
            lastMargin = frame.minX + frame.width
            let imageView = UIImageView(image: UIImage(named: deviceAction.iconName))
            imageView.frame = frame
            imageView.contentMode = UIViewContentMode.scaleAspectFit
            
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.actionTapped(_:))))
            
            deviceActionsView.addSubview(imageView)
        }
    }
    
    func actionTapped(_ sender: UITapGestureRecognizer) {
        print("tapped")
    }
}

//
//  DeviceManager.swift
//  Wall-e
//
//  Created by Doug Guastaferro on 12/2/17.
//  Copyright © 2017 Doug Guastaferro. All rights reserved.
//

import Foundation

class DeviceManager {
    static let sharedInstance = DeviceManager()
    private(set) var devices = [Device]()
    
    func tappedDeviceAction(deviceIndex: Int, actionIndex: Int) {
        let device = devices[deviceIndex]
        let deviceAction = device.actions[actionIndex]
        
        NetworkManager.sendAction(device: device, deviceAction: deviceAction)
    }
    
    private func sendAction(device: Device, actionIndex: Int) {
        
    }
    
    private init() {
        self.devices = [makeTv(), makeSoundbar()]
    }
    
    private func makeTv() -> Device {
        let tvPowerAction = DeviceAction(iconName: "power", actionParam: "power")
        return Device(displayName: "TV", imageName: "tv", endpoint: "tv", actions: [tvPowerAction])
    }
    
    private func makeSoundbar() -> Device {
        let powerAction = DeviceAction(iconName: "power", actionParam: "power")
        let volUpAction = DeviceAction(iconName: "volume_up", actionParam: "volume_up")
        let volDownAction = DeviceAction(iconName: "volume_down", actionParam: "volume_down")
        let actions = [powerAction, volUpAction, volDownAction]
        return Device(displayName: "Sound Bar", imageName: "soundbar", endpoint: "soundbar", actions:actions)
    }
}

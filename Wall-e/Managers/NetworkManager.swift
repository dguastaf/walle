//
//  NetworkManager.swift
//  Wall-e
//
//  Created by Doug Guastaferro on 12/13/17.
//  Copyright © 2017 Doug Guastaferro. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    private static let BaseUrl = "http://192.168.1.12:5000"
    
    static func sendAction(device: Device, deviceAction: DeviceAction) {
        let devicePath = device.endpoint
        let deviceActionParam = deviceAction.actionParam
        
        let json: Parameters = [
            "action": deviceActionParam
        ]
        
        print("Sending \(deviceAction.actionParam) request to \(device.displayName)")
        
        Alamofire.request("\(NetworkManager.BaseUrl)/\(devicePath)",
            method: .post,
            parameters: json,
            encoding: JSONEncoding.default).response { (response) in
                print(response)
        }
    }
}

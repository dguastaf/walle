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
    private static let KeyActionParam = "action"
    
    static func sendAction(device: Device, deviceAction: DeviceAction) {
        let devicePath = device.endpoint
        let deviceActionParam = deviceAction.actionParam
        
        let json: Parameters = [
            KeyActionParam: deviceActionParam
        ]
        
        print("Sending \(deviceAction.actionParam) request to \(device.displayName)")
        
        Alamofire.request("\(NetworkManager.BaseUrl)/\(devicePath)",
            method: .post,
            parameters: json,
            encoding: URLEncoding.queryString)
            .validate()
            .response { (response) in
                if response.response?.statusCode != 200 {
                    print (response)
                }
        }
    }
}

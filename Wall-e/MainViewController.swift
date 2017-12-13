//
//  ViewController.swift
//  Wall-e
//
//  Created by Doug Guastaferro on 10/15/17.
//  Copyright © 2017 Doug Guastaferro. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DeviceManager.sharedInstance.devices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deviceCell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as! DeviceCell
        deviceCell.setupWithDevice(DeviceManager.sharedInstance.devices[indexPath.row])
        return deviceCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
//
//    @IBAction func didTapOnTv(_ sender: Any) {
//        if (isTvOn) {
//            turnOffTv()
//        } else {
//            turnOnTv()
//        }
//
//        let json: Parameters = [
//            "tv_power": isTvOn
//        ]
//        Alamofire.request("http://192.168.1.12:5000/tvcommand", method: .post, parameters: json, encoding:JSONEncoding.default)
//    }
//
//    private func refreshStatus() {
//        Alamofire.request("http://192.168.1.12:5000/status").responseJSON { [weak self] response in
//            if let json = response.result.value as? [String: Any],
//                let devices = json["devices"] as? [String: Any],
//                let tv = devices["tv"] as? [String: Any],
//                let tvOn = tv["power_on"] as? Bool {
//                print("Is the tv on \(tvOn)")
//                self?.tvStatusView.backgroundColor = tvOn ? UIColor.green : UIColor.red
//                self?.isTvOn = tvOn
//            }
//        }
//    }
//
//    private func turnOffTv() {
//        tvStatusView.backgroundColor = UIColor.red
//        // send command to turn off tv
//        isTvOn = false
//    }
//
//    private func turnOnTv() {
//        tvStatusView.backgroundColor = UIColor.green
//        // send command to turn on tv
//        isTvOn = true
//    }

}


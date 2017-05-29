//
//  ViewController.swift
//  MyEthereumWallet
//
//  Created by Rob Enriquez on 5/29/17.
//  Copyright © 2017 Robert Enriquez. All rights reserved.
//

import UIKit
//import Geth

class ViewController: UIViewController {

    //constants
    let keyStoreKey = "/keystore2"
    let passwordKey = "Creation password"
    let importPasswordKey = "Import password"
    let exportPaswordKey = "Export password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        setupAccount()
    }

//    func setupAccount() {
//        guard let dataDir: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
//            // TODO: add error logging
//            NSLog("Failed to create dataDir")
//            return
//        }
//
//        guard let am = GEGethNewAccountManager(dataDir + keyStoreKey, GEGethStandardScryptN, GEGethStandardScryptP) else {
//            // TODO: add error logging
//            NSLog("Failed to instantitiate account manager")
//            return
//        }
//        
//        do {
//            //create new account
//            var newAcc: GEGethAccount?
//            try am.newAccount(passwordKey, ret0_: &newAcc)
//            print("NEW: \(String(describing: newAcc?.getAddress().getHex()))")
//            
//            //JSON key
//            var jsonKey: NSData?
//            try am.exportKey(newAcc, passphrase: passwordKey, newPassphrase: exportPaswordKey, ret0_: &jsonKey)
//            let jsonString = String(data: jsonKey! as Data, encoding: .utf8)
//            print("JSON: \(String(describing: jsonString))")
//            
//            //delete account
//            try am.delete(newAcc, passphrase: passwordKey)
//            let accsString = String(am.getAccounts().size())
//            print("Accs: \(accsString)")
//            
//            var impAcc: GEGethAccount?
//            try am.importKey(jsonKey! as Data, passphrase: exportPaswordKey, newPassphrase: importPasswordKey, ret0_: &impAcc)
//            let impAccString = String(describing: impAcc?.getAddress().getHex())
//            print("Imp: \(impAccString)")
//            
//        } catch {
//            NSLog("Failed to run process")
//        }
//    }
}


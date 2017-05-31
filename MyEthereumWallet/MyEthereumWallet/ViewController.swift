//
//  ViewController.swift
//  MyEthereumWallet
//
//  Created by Rob Enriquez on 5/29/17.
//  Copyright © 2017 Robert Enriquez. All rights reserved.
//

import UIKit
import Geth

class ViewController: UIViewController {

    //constants
    let keyStoreKey = "/keystore"
    let passwordKey = "Creation password"
    let importPasswordKey = "Import password"
    let exportPaswordKey = "Export password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccount()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setupAccount() {
        guard let dataDir: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            // TODO: add error logging
            NSLog("Failed to create dataDir")
            return
        }

        guard let ks = GethNewKeyStore(dataDir + keyStoreKey, GethLightScryptN, GethLightScryptP) else {
            // TODO: add error logging
            NSLog("Failed to instantitiate account manager")
            return
            
        }
        
        do {
            // Create a new account with the specified encryption passphrase.
            let newAcc = try ks.newAccount("Creation password")
            print("NEW: \(String(describing: newAcc.getAddress().getHex()))")

            // Export the newly created account with a different passphrase. The returned
            // data from this method invocation is a JSON encoded, encrypted key-file.
            let jsonKey = try ks.exportKey(newAcc, passphrase: "Creation password", newPassphrase: "Export password")
            print("JSON: \(String(describing: jsonKey))")

            // Update the passphrase on the account created above inside the local keystore.
            try ks.update(newAcc, passphrase: "Creation password", newPassphrase: "Update password")
            print("UPDATE: \(String(describing: newAcc.getAddress().getHex()))")
            
            // Delete the account updated above from the local keystore.
            try ks.delete(newAcc, passphrase: "Update password")
            print("DELETE: \(newAcc)")

            // Import back the account we've exported (and then deleted) above with yet
            // again a fresh passphrase.
            let impAcc  = try ks.importKey(jsonKey, passphrase: "Export password", newPassphrase: "Import password")
            print("IMPORT: \(impAcc)")

        } catch {
            NSLog("Failed to run process")
        }
    }
}


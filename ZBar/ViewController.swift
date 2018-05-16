//
//  ViewController.swift
//  ZBar
//
//  Created by PHILIP SHEN on 5/16/18.
//  Copyright © 2018 PHILIP SHEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZBarReaderDelegate {

    var reader: ZBarReaderViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reader = ZBarReaderViewController()
        reader.readerDelegate = self
        reader.scanner.setSymbology(ZBAR_QRCODE, config: ZBAR_CFG_ENABLE, to: 1)
        reader.readerView.zoom = 1.0
        reader.isModalInPopover = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.present(reader, animated: true, completion: nil)
    }
    
    // ZBar delegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let results = info[ZBarReaderControllerResults]
        print(String(describing: results))
    }

}


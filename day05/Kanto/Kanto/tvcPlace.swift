//
//  tvcPlace.swift
//  Kanto
//
//  Created by abduraghmaan GABRIELS on 2019/10/14.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit

class tvcPlace: UITableViewCell {
    @IBOutlet var lblPlaceName: UILabel!
    func setText(name:String){
        lblPlaceName.text = name
    }
}

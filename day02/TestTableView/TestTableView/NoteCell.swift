//
//  NoteCell.swift
//  TestTableView
//
//  Created by abduraghmaan GABRIELS on 2019/10/11.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {


    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDesc: UILabel!
    func setName(name:String?){
        lblName.text = name!
    }
    func setDesc(desc:String?){
        lblDesc.text = desc!
    }
    func setData(name:String?, desc:String?){
        setName(name: name)
        setDesc(desc: desc)
    }
}

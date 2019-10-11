//
//  NoteData.swift
//  TestTableView
//
//  Created by abduraghmaan GABRIELS on 2019/10/11.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import Foundation
class NoteData:NSObject{
    var name:String?
    var desc:String?
    init(Name name:String?, Description desc:String?){
        self.name=name!
        self.desc=desc!
    }
    override var description: String{
        return ("\(self.name!):\(self.desc!)")
    }
    
}

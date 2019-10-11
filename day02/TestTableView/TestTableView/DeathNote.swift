//
//  DeathNote.swift
//  TestTableView
//
//  Created by abduraghmaan GABRIELS on 2019/10/11.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit

class DeathNote: UIViewController {

    var notes:[NoteData]=[]
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        notes=createArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func addNote(array:[NoteData],name:String?, desc:String?)->[NoteData]{
        var tempArray:[NoteData]=[]
        tempArray = array;
        tempArray.append(NoteData(Name:name,Description: desc))
        return tempArray
    }
    func createArray()->[NoteData]{
        var tempArray:[NoteData]=[]
        tempArray = addNote(array:tempArray,name:"No Name", desc:"Hahahahahaha no One Died!")
        tempArray = addNote(array:tempArray,name:"Name 1", desc:"heart attack")
        tempArray = addNote(array:tempArray,name:"Name 2", desc:"heart attack")
        tempArray = addNote(array:tempArray,name:"Name 3", desc:"heart attack")
        tempArray = addNote(array:tempArray,name:"Name 4", desc:"heart attack")
        return tempArray;
    }
}

extension DeathNote:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:  "NoteCell") as! NoteCell
        cell.setData(name:note.name, desc:note.desc)
        return cell
    }
}

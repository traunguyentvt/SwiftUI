//
//  NoteTableCell.swift
//  NoteApp
//
//  Created by VT on 7/10/23.
//

import Foundation
import UIKit

class NoteTableCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configCell(note: Note?) {
        self.lblName.text = note?.text
        self.lblDescription.text = NoteDAO.convertDateToString(date: note?.updatedDate ?? Date(), format: "hh:mm:ss")
    }
}

@objc protocol NoteTableSourceDelegate {
    func tbv(didSelectRowAt indexPath: IndexPath)
}

class NoteTableSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var tbv: UITableView?
    var datas: [Note]?
    var delegate: NoteTableSourceDelegate?
    
    init(tbv: UITableView, datas: [Note]) {
        super.init()
        self.tbv = tbv
        self.datas = datas
        
        tbv.delegate = self
        tbv.dataSource = self
        
        if #available(iOS 15.0, *) {
            tbv.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableCell", for: indexPath) as? NoteTableCell {
            cell.configCell(note: self.datas?[indexPath.row])
            return cell
        }
        return NoteTableCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.tbv(didSelectRowAt: indexPath)
    }
}

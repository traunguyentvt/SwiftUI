//
//  MainViewCtrl.swift
//  NoteApp
//
//  Created by VT on 7/9/23.
//

import UIKit

class MainViewCtrl: BaseViewCtrl {
    
    @IBOutlet weak var tbvNote: UITableView!
    var noteFactory: NoteFactory = NoteFactory()
    
    lazy private var _tbvNoteSource: NoteTableSource = {
        let source = NoteTableSource(tbv: self.tbvNote, datas: self.noteFactory.notes)
        source.delegate = self
        return source
    }()
    
    private func initView() {
        self.title = "Notes"
        tbvNote.dataSource = self._tbvNoteSource
        createRightBarButtonItem(withImageName: "btnPlus")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func btnBtnRight_Pressed(_ sender: UIBarButtonItem? = nil) {
        let newNote = Note(text: "New note " + String(noteFactory.notes.filter({$0.text.contains("New note")}).count))
        noteFactory.notes.insert(newNote, at: 0)
//        _tbvNoteSource.datas?.insert(newNote, at: 0)
        NoteDAO.shared.save()
        reloadData()
    }
    
    private func reloadData() {
        _tbvNoteSource.datas = noteFactory.notes
        tbvNote.reloadData()
    }
}

extension MainViewCtrl: NoteTableSourceDelegate {
    func tbv(didSelectRowAt indexPath: IndexPath) {
        if let note = _tbvNoteSource.datas?[indexPath.row] {
            let detailVCtrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoteDetailViewCtrl") as! NoteDetailViewCtrl
            detailVCtrl.note = note
            detailVCtrl.noteFactory = self.noteFactory
            navigationController?.pushViewController(detailVCtrl, animated: true)
        }
    }
}


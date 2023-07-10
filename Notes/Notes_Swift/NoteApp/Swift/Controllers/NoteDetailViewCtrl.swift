//
//  NoteDetailVCtrl.swift
//  NoteApp
//
//  Created by VT on 7/10/23.
//

import UIKit

class NoteDetailViewCtrl: BaseViewCtrl {
    
    @IBOutlet weak var tvNote: UITextView!
    
    var note: Note?
    var noteFactory: NoteFactory?
    var isChanged: Bool = false
    
    init(note: Note) {
        super.init()
        self.note = note
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func loadData() {
        self.tvNote.text = self.note?.text
        self.title = NoteDAO.convertDateToString(date: note?.updatedDate ?? Date(), format: "MM-dd-yyyy")
    }
    
    private func initView() {
        createLeftBarButtonItem(withImageName: "btnBack")
        self.tvNote.layer.borderWidth = 1
        self.tvNote.layer.borderColor = UIColor.gray.cgColor
    }
    
    private var noteIndex: Int {
        return self.noteFactory?.notes.firstIndex(where: {$0.id == self.note?.id}) ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func btnBtnLeft_Pressed(_ sender: UIBarButtonItem? = nil) {
        if self.isChanged {
            self.noteFactory?.notes[self.noteIndex].text = self.note?.text ?? ""
            self.noteFactory?.notes[self.noteIndex].updatedDate = self.note?.updatedDate ?? Date()
            NoteDAO.shared.save()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDelete_Pressed(_ sender: UIButton) {
        self.noteFactory?.notes.remove(at: self.noteIndex)
        NoteDAO.shared.save()
        self.navigationController?.popViewController(animated: true)
    }
}

extension NoteDetailViewCtrl: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.note?.text = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
        self.note?.updatedDate = Date()
        self.isChanged = true
    }
}

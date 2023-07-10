//
//  BaseViewCtrl.swift
//  NoteApp
//
//  Created by VT on 7/10/23.
//

import UIKit

class BaseViewCtrl: UIViewController {
    
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func createNavButton(withImageName: String, action: Selector?) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: UIImage(named: withImageName), style: .plain, target: self, action: action)
//        barButton.tintColor = .white
        return barButton
    }
    
    func createLeftBarButtonItem(withImageName: String) {
        navigationItem.leftBarButtonItem = createNavButton(withImageName: withImageName, action: #selector(btnBtnLeft_Pressed(_:)))
    }
    
    func createRightBarButtonItem(withImageName: String) {
        navigationItem.rightBarButtonItem = createNavButton(withImageName: withImageName, action: #selector(btnBtnRight_Pressed(_:)))
    }
    
    @objc func btnBtnLeft_Pressed(_ sender: UIBarButtonItem? = nil) {
        
    }
    
    @objc func btnBtnRight_Pressed(_ sender: UIBarButtonItem? = nil) {
        
    }
}

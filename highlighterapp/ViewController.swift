//
//  ViewController.swift
//  highlighterapp
//
//  Created by s0x on 31/7/20.
//  Copyright © 2020 s0x. All rights reserved.
//

import UIKit
import Highlightr

class ViewController: UIViewController {

    var textView : UITextView!
    var highlightr : Highlightr!
    let textStorage = CodeAttributedString()
    
    @IBOutlet weak var hlView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textStorage.language = "swift"
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: view.bounds.size)
        layoutManager.addTextContainer(textContainer)
        textView = UITextView(frame: hlView.bounds, textContainer: textContainer)
        textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        textView.autocorrectionType = UITextAutocorrectionType.no
        textView.autocapitalizationType = UITextAutocapitalizationType.none
        textView.backgroundColor = UIColor.black
        hlView.addSubview(textView)

        let code = try! String.init(contentsOfFile: Bundle.main.path(forResource: "sampleCode", ofType: "txt")!)
        textView.text = code
        print(code)
        highlightr = textStorage.highlightr
    }


}


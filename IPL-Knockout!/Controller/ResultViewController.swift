//
//  ResultViewController.swift
//  IPL-Knockout!
//
//  Created by pranay chander on 03/03/21.
//

import UIKit


protocol PlayIPLKnockout: class {
    func replay()
}

class ResultViewController: UIViewController {
    @IBOutlet weak var resultMessageLabel: UILabel!
    @IBOutlet weak var replayButton: UIButton!

    var winner = ""

    var resultMessage: String {
        return "\(winner) wins the Decathlon IPL KnockOut 2021"
    }

    weak var delegate:  PlayIPLKnockout?

    override func viewDidLoad() {
        super.viewDidLoad()
        replayButton.layer.cornerRadius = replayButton.bounds.height/2
        self.resultMessageLabel.text = resultMessage
    }
    
    @IBAction func replayButtonTapped(_ sender: UIButton) {
        delegate?.replay()
        self.dismiss(animated: true, completion: nil)
    }
}

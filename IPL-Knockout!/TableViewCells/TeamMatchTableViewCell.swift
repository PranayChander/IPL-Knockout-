//
//  TeamMatchTableViewCell.swift
//  IPL-Knockout!
//
//  Created by pranay chander on 02/03/21.
//

import UIKit

class TeamMatchTableViewCell: UITableViewCell {
    @IBOutlet weak private var team2Logo: UIImageView!
    @IBOutlet weak private var team1Logo: UIImageView!
    @IBOutlet weak private var team1Label: UILabel!
    @IBOutlet weak private var team2Label: UILabel!
    @IBOutlet weak private var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = 20.0
            self.containerView.layer.shadowColor = Colors.iplThemeColor.cgColor
            self.containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.containerView.layer.shadowRadius = 7.0
            self.containerView.layer.shadowOpacity = 0.7
        }
    }

    func configureCell(withTeam1 team1: String, withTeam2 team2: String) {
        self.team1Label.text = team1
        self.team1Logo.image = UIImage(named: team1)
        self.team2Label.text = team2
        self.team2Logo.image = UIImage(named: team2)
    }
}

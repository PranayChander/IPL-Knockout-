//
//  SingleTeamTableViewCell.swift
//  IPL-Knockout!
//
//  Created by pranay chander on 02/03/21.
//

import UIKit

class SingleTeamTableViewCell: UITableViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var teamLogo: UIImageView!
    @IBOutlet weak private var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = 20.0
            self.containerView.layer.shadowColor = Colors.iplThemeColor.cgColor
            self.containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.containerView.layer.shadowRadius = 7.0
            self.containerView.layer.shadowOpacity = 0.7
        }
    }
    @IBOutlet weak var stackView: UIStackView!

    func configureCell(withTeam team: String) {
        self.nameLabel.text = team
        self.teamLogo.image = UIImage(named: team)
    }
}

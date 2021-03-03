//
//  ViewController.swift
//  IPL-Knockout!
//
//  Created by pranay chander on 02/03/21.
//

import UIKit

class IPLKnockoutMainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var simulateButton: UIButton! {
        didSet {
            self.simulateButton.layer.cornerRadius = simulateButton.bounds.height / 2
        }
    }

    private let viewModel = IPLKnockoutViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        self.initialiseData()
    }

    private func registerTableViewCells() {
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.singleTeamTVC, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.singleTeamTVC)
        self.tableView.register(UINib(nibName: TableViewCellIdentifiers.teamMatchTVC, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.teamMatchTVC)
    }

    private func initialiseData() {
        self.viewModel.reset()
        self.tableView.reloadData()
        self.navigationItem.title = "IPL KNOCKOUT"
        self.configureSimulateButton()
    }

    private func proceedToNextLevel() {
        self.viewModel.generateFixtures()
        self.viewModel.upgradeLevel()
        self.navigationItem.title = self.viewModel.currentLevel.navBarTitle
        self.configureSimulateButton()
        self.tableView.reloadData()
    }

    private func configureSimulateButton() {
        self.simulateButton.setTitle(viewModel.simulateButtonTitle, for: .normal)
    }

    @IBAction func didTapSimulateButton(_ sender: UIButton) {
        if viewModel.currentLevel == .finals {
            self.performSegue(withIdentifier: SegueIdentifiers.resultsSegue, sender: self)
        } else {
            self.proceedToNextLevel()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultViewController {
            resultVC.winner = viewModel.winner()
            resultVC.delegate = self
        }
    }
}

//MARK:- UITableViewDataSource and UITableViewDelegate Methods
extension IPLKnockoutMainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.displayFixturesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.currentLevel == .qualifiers {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.singleTeamTVC, for: indexPath) as? SingleTeamTableViewCell else {
                return UITableViewCell()
            }
            cell.configureCell(withTeam: viewModel.teams[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.teamMatchTVC, for: indexPath) as? TeamMatchTableViewCell else {
                return UITableViewCell()
            }
            cell.configureCell(withTeam1: viewModel.currentLevelFixtures[indexPath.row].0, withTeam2: viewModel.currentLevelFixtures[indexPath.row].1)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.currentLevel == .qualifiers ? 250 : 350
    }
}

//MARK:- Delegate Method to Replay IPL Knockout
extension IPLKnockoutMainViewController: PlayIPLKnockout {
    func replay() {
        self.initialiseData()
    }
}

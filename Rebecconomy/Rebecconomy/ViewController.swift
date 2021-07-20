//
//  ViewController.swift
//  Rebecconomy
//
//  Created by pedro.silveira on 19/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Rebecconomy"
    }

    override func viewWillAppear(_ animated: Bool) {
        setupTableView()
    }

    private func setupTableView() {
        listTableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? RegisterCostViewController else {
            preconditionFailure("destination should have RegisterCostViewController type")
        }

        viewController.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Usar o manager para saber o número de linhas
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? RebecconomyTableViewCell else {
            preconditionFailure("The cell should be registered")
        }

        // TODO: Usar o manager para construir a celula

        return cell
    }
}

extension ViewController: RegisterCostViewControllerDelegate {
    func didRegister() {
        listTableView.reloadData()
    }
}


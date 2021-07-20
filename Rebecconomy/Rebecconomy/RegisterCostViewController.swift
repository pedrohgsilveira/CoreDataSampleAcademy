//
//  RegisterCostViewController.swift
//  Rebecconomy
//
//  Created by pedro.silveira on 19/07/21.
//

import UIKit

protocol RegisterCostViewControllerDelegate: AnyObject {
    func didRegister()
}

class RegisterCostViewController: UIViewController {

    weak var delegate: RegisterCostViewControllerDelegate?

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var subtitleTextField: UITextField!

    @IBOutlet weak var registerCostButton: UIButton!

    @IBAction func titleTextFieldDidEndEditing(_ sender: UITextField) {

        if let title = sender.text, title != "" {
            titleFlag = true

            setButtonState()
            return
        }

        titleFlag = false
        return
    }

    @IBAction func subtitleTextFieldDidEndEditing(_ sender: UITextField) {

        if let subtitle = sender.text, subtitle != "" {
            subtitleFlag = true

            setButtonState()
            return
        }

        subtitleFlag = false
        return
    }

    private var titleFlag: Bool = false

    private var subtitleFlag: Bool = false

    override func viewDidLoad() {
        registerCostButton.isEnabled = false
        registerCostButton.setTitleColor(.gray, for: .disabled)
        registerCostButton.setTitleColor(.systemBlue, for: .normal)

        setupDoneButton()
    }

    private func setButtonState() {
        registerCostButton.isEnabled = titleFlag && subtitleFlag
    }

    private func setupDoneButton() {
        setupTitleTextFieldDoneButton()
        setupSubtitleTextFieldDoneButton()
    }

    private func setupTitleTextFieldDoneButton() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(titleTextFieldDoneButtonAction))

        toolBar.setItems([doneButton], animated: true)

        titleTextField.inputView = toolBar
    }

    private func setupSubtitleTextFieldDoneButton() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(subtitleTextFieldDoneButtonAction))

        toolBar.setItems([doneButton], animated: true)

        subtitleTextField.inputView = toolBar
    }

    @objc func titleTextFieldDoneButtonAction(){
        titleTextField.resignFirstResponder()
    }

    @objc func subtitleTextFieldDoneButtonAction(){
        subtitleTextField.resignFirstResponder()
    }

    @IBAction func registerCost(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

        delegate?.didRegister()
        // TODO: Usar o manager para salvar o custo
    }
}

//
//  AddPlayerController.swift
//  myTurnYourTurn
//
//  Created by Ana Freitas Sampaio on 2/17/19.
//  Copyright © 2019 Ana Caroline Freitas Sampaio. All rights reserved.
//

import UIKit

protocol AddPlayerViewControllerDelegate: class {
    func addPlayerControllerDidCancel(_ controller: AddPlayerController)
    func addPlayerController(_ controller: AddPlayerController, didFinishAdding player: Player)
}

class AddPlayerController: UITableViewController {
    
    weak var delegate: AddPlayerViewControllerDelegate?
    weak var playerList: PlayerList?
    weak var playerToEdit: Player?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        nameTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.addPlayerControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        if let playerName = nameTextField.text {
            let player = Player(name: playerName, color: .red)
            delegate?.addPlayerController(self, didFinishAdding: player)
        }
    }
}

extension AddPlayerController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let oldText = nameTextField.text,
              let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        
        return true
    }
}

extension AddPlayerController: AddPlayerViewControllerDelegate {
    func addPlayerControllerDidCancel(_ controller: AddPlayerController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addPlayerController(_ controller: AddPlayerController, didFinishAdding item: Player) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

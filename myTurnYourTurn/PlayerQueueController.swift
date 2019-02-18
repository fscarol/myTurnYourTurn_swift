//
//  ViewController.swift
//  myTurnYourTurn
//
//  Created by Ana Freitas Sampaio on 2/8/19.
//  Copyright © 2019 Ana Caroline Freitas Sampaio. All rights reserved.
//

import UIKit

class PlayerQueueController: UITableViewController {

    var players: PlayerList
    
    @IBAction func addPlayer(_ sender: Any) {
        let newRowIndex = players.playerList.count
        _ = players.newPlayer()
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    required init?(coder aDecoder: NSCoder) {
        players = PlayerList()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.playerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerListItem", for: indexPath)
        let item = players.playerList[indexPath.row]
        configureName(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        players.playerList.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureName(for cell: UITableViewCell, with item: Player) {
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.name
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPlayerSegue" {
            if let addPlayerController = segue.destination as? AddPlayerController {
                addPlayerController.delegate = self
            }
        }
    }
}
    // Only the first row can be able to click and drag to the right
    // When the first user drag his row to the right, he goes to the end of the line
    // All rows can be dragged to the left and deleted from the queue
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let cell = tableView.cellForRow(at: indexPath) {
            // Check if the cell is the first one and allows the drag
//        }

        // Deselect the row clicked
//        tableView.deselectRow(at: indexPath, animated: true)
//    }

//}

extension PlayerQueueController: AddPlayerViewControllerDelegate {
    func addPlayerControllerDidCancel(_ controller: AddPlayerController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addPlayerController(_ controller: AddPlayerController, didFinishAdding player: Player) {
        navigationController?.popViewController(animated: true)
        let rowIndex = players.playerList.count
        players.playerList.append(player)
        let indexPath = IndexPath(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    
}

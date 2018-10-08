//
//  ViewController.swift
//  ZumbeaversPOC
//
//  Created by Giovani Pereira on 05/10/18.
//  Copyright © 2018 Giovani Pereira. All rights reserved.
//

import UIKit

let imagem: UIImage = UIImage(named: "imagem01")!

enum CellType {
    case text(text: String)
    case image(image: UIImage)
}

class ViewController: UIViewController {
    
    var cells: [CellType] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didPressAdd(sender: Any?) {
        let alert = UIAlertController(title: "Adicionar", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Adicionar imagem", style: .default, handler: { (_) in
            self.saveCells()
            self.cells.append(.image(image: imagem))
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func saveCells() {
        if cells.count > 0 {
            for row in 0...(cells.count > 0 ? cells.count - 1 : 0) {
                let indexPath = IndexPath(row: row, section: 0)
                if let cell = tableView.cellForRow(at: indexPath) as? textCell {
                    let text = cell.textField.text ?? ""
                    cells[row] = .text(text: text)
                } else if let cell = tableView.cellForRow(at: indexPath) as? imageCell {
                    let image = cell.imageV.image ?? imagem
                    cells[row] = .image(image: image)
                }
            }
        }
        if let cell = tableView.cellForRow(at: IndexPath(row: cells.count, section: 0)) as? textCell {
            let text = cell.textField.text ?? ""
            cells.append(.text(text: text))
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == cells.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as? textCell else { return UITableViewCell ()}
            cell.setup(asset: CellType.text(text: ""))
            cell.textField.delegate = self
            return cell
        }
        let item = cells[indexPath.row]
        switch item {
        case .text:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as? textCell else { return UITableViewCell ()}
            cell.setup(asset: item)
            cell.textField.delegate = self
            return cell
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? imageCell else { return UITableViewCell ()}
            cell.setup(asset: item)
            return cell
        }
    }
    
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {}
}


class textCell: UITableViewCell {
    @IBOutlet var textField: UITextView!
    
    func setup(asset: CellType) {
        switch asset {
        case .text(let info):
            self.textField.text = info
        default:
            return
        }
    }
}

class imageCell: UITableViewCell {
    @IBOutlet var imageV: UIImageView!
    
    func setup(asset: CellType) {
        switch asset {
        case .image(let img):
            self.imageV.image = img
        default:
            return
        }
    }
}

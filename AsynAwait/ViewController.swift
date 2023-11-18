//
//  ViewController.swift
//  AsynAwait
//
//  Created by Elver Mayta Hernández on 16/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablelist: UITableView!
    
    let viewModel = ViewModel()
    private var datosPais : [[Any]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await viewModel.DataPais()
        }
    }

}


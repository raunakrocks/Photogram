//
//  ViewController.swift
//  Photogram
//
//  Created by Raunak Talwar on 6/1/21.
//

import UIKit

final class RootViewController: UIViewController {

    private let viewModel: RootViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }

    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


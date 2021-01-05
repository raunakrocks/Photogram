//
//  ViewController.swift
//  Photogram
//
//  Created by Raunak Talwar on 6/1/21.
//

import UIKit

final class RootViewController: UIViewController, UICollectionViewDataSource {

    private let viewModel: RootViewModel
    
    private lazy var containerView: UIView = {
        let view = UIView().withAutoLayout()
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar().withAutoLayout()
        let searchImage = UIImage(named: "search")!
        searchBar.setLeftImage(searchImage, with: 8, tintColor: UIColor.systemBlue)
        searchBar.textField?.placeholder = "Search Here!!"
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 64, height: 64)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).withAutoLayout()
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupContraints()
    }
    
    //MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(searchBar)
        containerView.addSubview(collectionView)
    }
    
    private func setupContraints() {
        var contraints = [NSLayoutConstraint]()
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        contraints.append(containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0))
        contraints.append(containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0))
        contraints.append(containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0))
        contraints.append(containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16.0))
        
        contraints.append(searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor))
        contraints.append(searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor))
        contraints.append(searchBar.topAnchor.constraint(equalTo: containerView.topAnchor))
        contraints.append(searchBar.heightAnchor.constraint(equalToConstant: 24.0))
        
        contraints.append(collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor))
        contraints.append(collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor))
        contraints.append(collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor))
        contraints.append(collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor))
        
        NSLayoutConstraint.activate(contraints)
    }
    
    //MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
}


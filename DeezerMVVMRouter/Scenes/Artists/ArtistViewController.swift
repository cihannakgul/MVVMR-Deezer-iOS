//
//  ArtistViewController.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 14.06.23.
//

import UIKit
import TinyConstraints
import UIComponents

final class ArtistViewController: BaseViewController<ArtistViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    private var cellItems: [ArtistCellProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        viewModel.getAllArtist()
        collectionView.register(ArtistCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        subscribeViewModel()
        viewModel.viewDidLoad()
        configureContents()
    }
}

// MARK: - Constraints
extension ArtistViewController {
    private func addSubViews() {
        addCollectionView()
    }
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(insets: .horizontal(2), usingSafeArea: true)
    }
}


// MARK: - Configure Contents
extension ArtistViewController {
    private func configureContents() {
        view.backgroundColor = .white
    }
}

// MARK: - SubscribeViewModel
extension ArtistViewController {
    
    private func subscribeViewModel() {
                viewModel.reloadData = {
                    self.collectionView.reloadData() }
        
        viewModel.titleName = { [weak self] name in
            guard let self = self else { return }
            self.navigationItem.title = name
            
        }
    }
}
// MARK: - UICollectionViewDelegate
extension ArtistViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(indexPath: indexPath)
        print("indexpath select \(indexPath)")
    }
    
}

// MARK: - UICollectionViewDataSource
extension ArtistViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ArtistCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
    
    
}


extension ArtistViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 24) / 3
        return .init(width: 200, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - RouteDelegate
extension ArtistViewController: ArtistViewDelegate {
    func showDetail(artist: ArtistCellProtocol) {
        let viewController = ArtistAlbumRouter.create(artist: artist)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
  
}

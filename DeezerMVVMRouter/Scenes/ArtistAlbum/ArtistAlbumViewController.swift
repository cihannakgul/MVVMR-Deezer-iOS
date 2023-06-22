//
//  ArtistAlbumViewController.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 19.06.23.
//

import UIKit
import DataProvider
import TinyConstraints
import Kingfisher
import UIComponents

final class ArtistAlbumViewController: BaseViewController<ArtistAlbumViewModel> {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let artistImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadArtistImage()
        addSubViews()
        viewModel.getAllAlbums()
        collectionView.register(AlbumCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        subscribeViewModel()
        viewModel.loadTitle()
        

        view.backgroundColor = .white
    }
    
}

// MARK: - Constraints
extension ArtistAlbumViewController {
    private func addSubViews() {
        addImageView()
        addCollectionView()
    }
    private func addImageView() {
        view.addSubview(artistImageView)
        artistImageView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        artistImageView.height(400)
        artistImageView.kf.setImage(with: viewModel.artistImage?.convertUrl, placeholder: .none)
        artistImageView.layer.cornerRadius = 5
        artistImageView.clipsToBounds = true
    }
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .top, usingSafeArea: true)
        collectionView.topToBottom(of: artistImageView)
    }
}

// MARK: - SubscribeViewModel
extension ArtistAlbumViewController {
    
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
extension ArtistAlbumViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        viewModel.didSelectItem(indexPath: indexPath)
        print("indexpath select \(indexPath)")
    }
    
}

// MARK: - UICollectionViewDataSource
extension ArtistAlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("againdebugzz \(viewModel.numberOfItems)")
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
    
    
}


extension ArtistAlbumViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return .init(width: width, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

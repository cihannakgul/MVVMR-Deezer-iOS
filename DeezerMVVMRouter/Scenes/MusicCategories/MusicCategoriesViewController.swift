//
//  MusicCategoriesViewController.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

import Foundation
import UIKit
import UIComponents
import DataProvider
final class MusicCategoriesViewController: BaseViewController<MusicCategoriesViewModel> {
    
    private var titleName: String?
 
    private var cellItems: [CategoriesCellProtocol] = []

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        viewModel.getAllCategories()
        collectionView.register(CategoriesCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        subscribeViewModel()
        viewModel.viewDidLoad()
        configureContents()
    }
 
}



// MARK: - Constraints
extension MusicCategoriesViewController {
    private func addSubViews() {
        addCollectionView()
    }
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(insets: .horizontal(2), usingSafeArea: true)
    }
}

// MARK: - Configure Contents
extension MusicCategoriesViewController {
    private func configureContents() {
        view.backgroundColor = .white
      
        guard let title = titleName else { return }
        navigationControllerConfig(titleName: title)
    }
}
// MARK: - SubscribeViewModel
extension MusicCategoriesViewController {
    
    private func subscribeViewModel() {

        viewModel.reloadData = {
            self.collectionView.reloadData() }
            
        viewModel.titleName = { [weak self] name in
            guard let self = self else { return }
            self.titleName = name
        }
    }
}
// MARK: - UICollectionViewDelegate
extension MusicCategoriesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(indexPath: indexPath)
        print("indexpath select \(indexPath)")
    }
    
}

// MARK: - UICollectionViewDataSource
extension MusicCategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoriesCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
    
    
}




extension MusicCategoriesViewController: UICollectionViewDelegateFlowLayout {
    
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
extension MusicCategoriesViewController: MusicCategoriesViewRouteDelegate {
    func showDetail(genre: CategoriesCellProtocol) {
        let viewController = ArtistRouter.create(genre: genre)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
  
}

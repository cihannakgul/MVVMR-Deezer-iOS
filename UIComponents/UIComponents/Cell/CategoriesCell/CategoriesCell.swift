//
//  CategoriesCell.swift
//  UIComponents
//
//  Created by cihan on 17.05.23.
//

import Foundation
import UIKit
import Kingfisher
public class CategoriesCell: UICollectionViewCell, ReusableView {

    weak var viewModel: CategoriesCellProtocol?
    
    private let categoriesImageView = UIImageView()
    private let categoriesTitleLabel = UILabel()
    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light) )

    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        configureContents()
    }
    
    public func set(viewModel: CategoriesCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
    
}


// MARK: - Constraints
extension CategoriesCell {
    private func addSubViews() {
        addCategoriesImageView()
        addCategoriesTitleLabel()

    }
    
    private func addCategoriesImageView() {
        contentView.addSubview(categoriesImageView)
        categoriesImageView.edgesToSuperview()
        categoriesImageView.addSubview(blurEffectView)
       

        blurEffectView.bottomToSuperview()
        blurEffectView.widthToSuperview()
        blurEffectView.height(48)
    
        blurEffectView.contentView.addSubview(categoriesTitleLabel)
        categoriesTitleLabel.centerInSuperview()
        
        
    }
    
    private func addCategoriesTitleLabel() {
 
     
    }
}

// MARK: - UILayout
extension CategoriesCell {
    private func configureContents() {
        configureCategoriesImageView()
        configureCategoriesTitleLabel()
        guard let viewModel = viewModel else { return }
        categoriesImageView.kf.setImage(with: viewModel.categoriesImageView?.convertUrl, placeholder: .none)
        categoriesTitleLabel.text = viewModel.categoriesTitle
    }
    private func configureCategoriesImageView() {
        //categoriesImageView.height(200)
        categoriesImageView.backgroundColor = .black
        categoriesImageView.layer.cornerRadius = 10
        categoriesImageView.clipsToBounds = true
    }
    
    private func configureCategoriesTitleLabel() {
        categoriesTitleLabel.font = .boldSystemFont(ofSize: 20)
        categoriesTitleLabel.textColor = .white
        categoriesTitleLabel.textAlignment = .center
        categoriesTitleLabel.numberOfLines = 0
    }
}

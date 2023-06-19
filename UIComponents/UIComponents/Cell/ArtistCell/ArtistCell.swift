//
//  ArtistCell.swift
//  UIComponents
//
//  Created by cihan on 15.06.23.
//

import Foundation
import Foundation
import UIKit
import Kingfisher

public class ArtistCell: UICollectionViewCell, ReusableView {

    weak var viewModel: ArtistCellProtocol?
    
    private let artistImageView = UIImageView()
    private let artistTitleLabel = UILabel()
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
    
    public func set(viewModel: ArtistCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
    
}


// MARK: - Constraints
extension ArtistCell {
    private func addSubViews() {
        addArtistImageView()
        addCategoriesTitleLabel()

    }
    
    private func addArtistImageView() {
        contentView.addSubview(artistImageView)
        artistImageView.edgesToSuperview()
        artistImageView.addSubview(blurEffectView)
       

        blurEffectView.bottomToSuperview()
        blurEffectView.widthToSuperview()
        blurEffectView.height(48)
    
        blurEffectView.contentView.addSubview(artistTitleLabel)
        artistTitleLabel.centerInSuperview()
        
        
    }
    
    private func addCategoriesTitleLabel() {
 
     
    }
}

// MARK: - UILayout
extension ArtistCell {
    private func configureContents() {
        configureArtistImageView()
        configureArtistTitleLabel()
        guard let viewModel = viewModel else { return }
        artistImageView.kf.setImage(with: viewModel.artistImageView?.convertUrl, placeholder: .none)
        artistTitleLabel.text = viewModel.artistTitle
    }
    private func configureArtistImageView() {
        //categoriesImageView.height(200)
        artistImageView.backgroundColor = .black
        artistImageView.layer.cornerRadius = 10
        artistImageView.clipsToBounds = true
    }
    
    private func configureArtistTitleLabel() {
        artistTitleLabel.font = .boldSystemFont(ofSize: 20)
        artistTitleLabel.textColor = .white
        artistTitleLabel.textAlignment = .center
        artistTitleLabel.numberOfLines = 0
    }
}

//
//  AlbumCell.swift
//  UIComponents
//
//  Created by cihan on 19.06.23.
//
import Foundation
import UIKit
import Kingfisher
public class AlbumCell: UICollectionViewCell, ReusableView {

    weak var viewModel: AlbumCellProtocol?

    public let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    public var albumTitleLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    // JOB TO DO CHANGE THEM PRIVATE
    public var albumDate: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    public var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()

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

    public func set(viewModel: AlbumCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

extension AlbumCell {
    private func addSubViews() {
        addImageView()
        addStackView()
    }
    private func addStackView() {
        labelStackView.addArrangedSubview(albumTitleLabel)
        labelStackView.addArrangedSubview(albumDate)
        contentView.addSubview(labelStackView)
        labelStackView.edgesToSuperview(excluding: .left)
        labelStackView.leftToRight(of: albumImageView)

    }
    private func addImageView() {
        contentView.addSubview(albumImageView)
        albumImageView.edgesToSuperview(excluding: .right)
        albumImageView.width(130)
    }
}
extension AlbumCell {
    private func configureContents() {
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 2
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5.0)
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
         guard let viewModel = viewModel else { return }
        albumDate.text = viewModel.albumDate
        albumTitleLabel.text = viewModel.albumTitle
        albumImageView.kf.setImage(with: viewModel.albumImageView?.convertUrl, placeholder: .none)
    }
}

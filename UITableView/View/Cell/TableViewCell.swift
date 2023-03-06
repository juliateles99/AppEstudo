//
//  TableViewCell.swift
//  UITableView
//
//  Created by Julia Teles on 14/02/23.
//

// Diferenca de contentview e view
// Quando colocar isActive e quando nao colocar
// Diferenca de UIIMage e UIImageView
// o que é a required init
// dificuldade em arredondar imagens
// dificuldade na organizacao dos codigos

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    private let imageIconHome: UIImageView = {
        let imgHome = UIImageView()
        imgHome.tintColor = .label
        
        return imgHome
    }()
    
    private let lbAgentsHome: UILabel = {
        let lbHome = UILabel()
        lbHome.textColor = .label
        lbHome.textAlignment = .left
        lbHome.font = .systemFont(ofSize: 24, weight: .medium)
        
        return lbHome
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with agent: Agent) {
        self.imageIconHome.image = UIImage(named: agent.avatar)
        self.lbAgentsHome.text = agent.name
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.contentView.addSubview(imageIconHome)
        self.contentView.addSubview(lbAgentsHome)
    
        imageIconHome.translatesAutoresizingMaskIntoConstraints = false
        lbAgentsHome.translatesAutoresizingMaskIntoConstraints = false
        
        imageIconHome.layer.cornerRadius =  25
        imageIconHome.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            imageIconHome.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            imageIconHome.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            imageIconHome.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            imageIconHome.widthAnchor.constraint(equalToConstant: 50),
        
            lbAgentsHome.leadingAnchor.constraint(equalTo: self.imageIconHome.trailingAnchor, constant: 16),
            lbAgentsHome.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            lbAgentsHome.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            lbAgentsHome.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            
        ])

    }
}

//
//  ItemDetailViewController.swift
//  UITableView
//
//  Created by Julia Teles on 13/02/23.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    // MARK: - DataSource
    public var agent: Agent?
    
    private var imageDetails: UIImageView = UIImageView(frame: .zero)
    
    private let labelAgentsText: UILabel = {
        let lbAgentsDetails = UILabel()
        lbAgentsDetails.font = .systemFont(ofSize: 35, weight: .medium)
        
        
        return lbAgentsDetails
    }()
    
    private let labelAgentsDescription: UILabel = {
        let lbAgentsDesciption = UILabel()
        lbAgentsDesciption.font = .systemFont(ofSize: 20, weight: .light)
        lbAgentsDesciption.numberOfLines = 0
        lbAgentsDesciption.textAlignment = .justified
        
        return lbAgentsDesciption
    }()
    
     private func configure() {
         if let avatar = agent?.avatar, let agentImage = UIImage(named: avatar) {
             imageDetails = UIImageView(image: agentImage)
             imageDetails.contentMode = .scaleAspectFit
         }
         imageDetails.layoutSubviews()
         
         self.labelAgentsText.text = agent?.name
         self.labelAgentsDescription.text = agent?.about
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detalhes do Agente"
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    private func setupUI() {
        
        let stackView = UIStackView(frame: .zero)
        stackView.addArrangedSubview(imageDetails)
        stackView.addArrangedSubview(labelAgentsText)
        stackView.addArrangedSubview(labelAgentsDescription)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalCentering

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            imageDetails.widthAnchor.constraint(equalToConstant: imageDetails.frame.size.width),
           imageDetails.heightAnchor.constraint(equalToConstant: imageDetails.frame.size.height),
 ])
        imageDetails.layoutIfNeeded()
        imageDetails.layer.cornerRadius = imageDetails.frame.size.height / 2
        print(imageDetails.frame.size.height / 2)
        imageDetails.layer.masksToBounds = true
        imageDetails.translatesAutoresizingMaskIntoConstraints = false
    }
    
}



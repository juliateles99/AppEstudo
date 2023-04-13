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
    //
    
    // TODO: - Fix image loading
    var imageDetails: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    //
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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detalhes do Agente"
        
        DispatchQueue.main.async {
            self.setupUI()
            self.configure()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupUI() {
        
        var width = 80.0
        var height = 80.0
        
        if let avatar = agent?.avatar, let agentImage = UIImage(named: avatar) {
            width = agentImage.size.width
            height = agentImage.size.height
        }
        
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
            
            imageDetails.widthAnchor.constraint(equalToConstant: width),
            imageDetails.heightAnchor.constraint(equalToConstant: height)
        ])
        
        //        imageDetails.layoutIfNeeded()
        //        imageDetails.layer.cornerRadius = imageDetails.frame.size.height / 2
        //        print(imageDetails.frame.size.height / 2)
        //        imageDetails.layer.masksToBounds = true
        
        //        imageDetails.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    private func configure() {
        if let avatar = agent?.avatar, let agentImage = UIImage(named: avatar) {
            
            print("The current image is: \(agentImage)")
            
            imageDetails = UIImageView(image: UIImage(named: avatar, in: .main, compatibleWith: UITraitCollection.current))
            //                imageDetails.image = agentImage
            imageDetails.contentMode = .scaleAspectFit
            
        }
        
        //        imageDetails.layoutSubviews()
        
        labelAgentsText.text = agent?.name
        labelAgentsDescription.text = agent?.about
    }
    
}



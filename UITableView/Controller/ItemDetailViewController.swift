//
//  ItemDetailViewController.swift
//  UITableView
//
//  Created by Julia Teles on 13/02/23.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    public var agent: Agent?
    
    private let imageDetails: UIImageView = {
        let imgDetails = UIImageView()
        imgDetails.layer.cornerRadius = imgDetails.frame.width / 2
        imgDetails.layer.masksToBounds = true
        imgDetails.contentMode = .scaleAspectFit
        
        return imgDetails
    }()
    
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
         self.imageDetails.image = UIImage(named: agent!.avatar)!
         self.labelAgentsText.text = agent?.name
         self.labelAgentsDescription.text = agent?.about
    }
    
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

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
       //  imageDetails.layer.cornerRadius =  imageDetails.frame.height / 2
       //  imageDetails.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -30),
            
            imageDetails.widthAnchor.constraint(equalToConstant: 400),
            imageDetails.heightAnchor.constraint(equalToConstant: 400),
 ])
        
    }
    
}



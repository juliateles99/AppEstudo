//
//  ViewController.swift
//  UITableView
//
//  Created by Julia Teles on 31/01/23.
//

import UIKit

class AgentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - DataSource
    var agents: [Agent] = []
    
    private func initDataSource() {
        let jett = Agent(name: "Jett", about: "Representando a Coreia do Sul, sua terra natal, Jett tem um estilo de luta ágil e evasivo que permite que ela assuma riscos como ninguém. Ela corre em meio a qualquer confronto, cortando os inimigos antes mesmo que eles percebam quem ou o que os atingiu.", avatar: "Jett")
        let phoenix = Agent(name: "Phoenix", about: "Phoenix puxa uma espécie de bola de fogo que pode ser jogada no chão. A habilidade, além de dar dano em inimigos como uma molotov, cura Phoenix caso ele esteja em cima. Mãos Quentes pode ser utilizada de duas formas: para dar dano em inimigos ou para Phoenix se curar.", avatar: "Phoenix")
        let raze = Agent(name: "Raze", about: "Raze é originária de Salvador, Bahia. Cheia de carisma e com sotaque cativante, a agente é um dos personagens com mais personalidade no game. Em seu ataque, ela utiliza duas C4, granadas, um pequeno robô explosivo e um lança-mísseis, capaz de eliminar rapidamente os adversários.", avatar: "Raze")
        let sage = Agent(name: "Sage", about: "Como uma verdadeira fortaleza chinesa, Sage traz segurança para si mesma e para a equipe aonde quer que vá. Capaz de reviver aliados e rechaçar investidas agressivas, ela oferece um centro de calmaria em meio ao caos da batalha.", avatar: "Sage")
        let skye = Agent(name: "Skye", about: "Skye é a 13º agente de Valorant e a primeira vindo da Austrália. Chamada por Sage para ajudar a salvar o mundo, ela está se juntando às forças do futuro próximo da Terra e compartilhando sua experiência em vida selvagem no campo de batalha. Skye definitivamente não é um fragger.", avatar: "Skye")
        let yoru = Agent(name: "Yoru", about: "Yoru, nativo do Japão, abre fendas na realidade para infiltrar as linhas inimigas sem ser visto. Ele usa tanto artimanhas quanto táticas agressivas, e os alvos são abatidos sem saber de onde o ataque veio.", avatar: "Yoru")
        agents.append(jett)
        agents.append(phoenix)
        agents.append(raze)
        agents.append(sage)
        agents.append(skye)
        agents.append(yoru)
    }
    
    // MARK: - UIComponents
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.rowHeight = 70
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        initDataSource()
        constrainTableView()
        title = "Agentes"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Setup UI
    private func constrainTableView(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            fatalError("The TableView could not dequeue a CustomCell in ViewController")
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: agents[indexPath.row])

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDetail = ItemDetailViewController()
        itemDetail.agent = agents[indexPath.row]
        navigationController?.pushViewController(itemDetail, animated: true)
        }
}




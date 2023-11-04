

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let sections = ["TO DO (6)", "COMPLETED (2)", "IN PROGRESS (12)"]
    
    private let names = ["Finish to do app desion concept", "Buy groceries", "Conference call with agency around Almaty", "Create analytic reports", "Dinner with Connie", "Update cloude storage"]
    
    private let images = ["mac", "buy", "chat", "analytic", "dinner", "cloud"]
    
    private let backgroundColors: [UIColor] = [
        UIColor(named: "red") ?? .red,
        UIColor(named: "blue") ?? .blue,
        UIColor(named: "green") ?? .green,
        UIColor(named: "cyan") ?? .cyan,
        UIColor(named: "orange") ?? .orange,
        UIColor(named: "purple") ?? .purple,
    ]
    
    private let additInfo = ["2 of 3 tasks are complete","0 of 28 tasks are complete","0 of 1 tasks are complete","0 of 11 tasks are complete","0 of 1 tasks are complete","0 of 1 tasks are complete" ]
    
    
    
    private let completedNames = ["Breakfast with agency", "Screen applicants"]
    private let completedAdditInfo = ["1 of 1 tasks are complete","6 of 6 tasks are complete"]
    
    
    private let inProgressNames = ["Develop new feature","Review project design","Write documentation","Client meeting preparation","Testing and bug fixing","Project analysis","Create marketing materials","Implement user feedback","Optimize database performance", "Monthly progress report","Team collaboration meeting","User interface enhancement"]
    private let inProgressadditInfo = ["2 of 3 tasks are complete","5 of 28 tasks are complete","3 of 4 tasks are complete","8 of 11 tasks are complete","7 of 13 tasks are complete","5 of 7 tasks are complete", "1 of 3 tasks are complete","7 of 21 tasks are complete","2 of 4 tasks are complete","5 of 11 tasks are complete","9 of 17 tasks are complete","3 of 7 tasks are complete" ]

    
    
    
    private lazy var namesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NameTableViewCell.self, forCellReuseIdentifier: "NameTableViewCell")
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        namesTableView.dataSource = self
        namesTableView.delegate = self
        
        let headerView = createCustomHeaderView()
        namesTableView.tableHeaderView = headerView
                
        
        setupUI()
    }
    
    private func createCustomHeaderView() -> UIView {
            let headerView = UIView()
            
            let calendarImageView = UIImageView(image: UIImage(named: "calendar"))
            headerView.addSubview(calendarImageView)
            
            let titleLabel = UILabel()
            titleLabel.text = "To do list"
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            headerView.addSubview(titleLabel)
        
            let much = UILabel()
            much.text = "20 tasks, 3 completed"
            much.textAlignment = .center
            much.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            much.textColor = .darkGray
            headerView.addSubview(much)
        
        
    
            let magnifyingGlassImageView = UIImageView(image: UIImage(named: "magnifyingglass"))
            headerView.addSubview(magnifyingGlassImageView)
    
            let stackView = UIStackView(arrangedSubviews: [calendarImageView, titleLabel, magnifyingGlassImageView])
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            headerView.addSubview(stackView)
    
            stackView.snp.makeConstraints { make in
               make.leading.equalTo(headerView).offset(12)
               make.trailing.equalTo(headerView).offset(-12)
               make.top.equalTo(headerView).offset(0)
            }
        much.snp.makeConstraints{ make in
            make.top.equalTo(stackView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        
            return headerView
        
    }
    
}

//MARK: - Table view data source methods
extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return names.count
        case 1:
            return completedNames.count
        case 2:
            return inProgressNames.count
        default:
            return 0
        }
    }




    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell
        
        let backgroundColor: UIColor
        var infoText: String = ""
        var name: String = ""
        
        switch indexPath.section {
        case 0:
            let colorIndex = indexPath.row % backgroundColors.count
            backgroundColor = backgroundColors[colorIndex]
            let imageName = images[indexPath.row]
            if UIImage(named: imageName) != nil {
                infoText = additInfo[indexPath.row]
                name = names[indexPath.row]
            }
        case 1:
            backgroundColor = .darkGray
            infoText = completedAdditInfo[indexPath.row]
            name = completedNames[indexPath.row]
    
        case 2:
            backgroundColor = UIColor(named: "orange") ?? .orange
            infoText = inProgressadditInfo[indexPath.row]
            name = inProgressNames[indexPath.row]
        default:
            backgroundColor = .clear
            infoText = ""
            name = ""
        }
        
        cell.configure(name: name, image: UIImage(named: images[indexPath.row]) ?? UIImage(), backgroundColor: backgroundColor, additInfo: infoText)
        
        return cell
    }

}

//MARK: - Table view delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.1
    }

}




// MARK: - UI setup methods
private extension ViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(namesTableView)
    }
    
    func setupConstraints() {
        namesTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(12)
        }

    }
}

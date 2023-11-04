
import UIKit

final class NameTableViewCell: UITableViewCell {
    
    private lazy var wholeView = UIView()
    
    private lazy var imageBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()

    
    
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var additInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dots")
        return imageView
    }()
    

    

    


    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(name: String, image: UIImage, backgroundColor: UIColor, additInfo: String) {
        nameLabel.text = name
        imageIcon.image = image
        imageBackgroundView.backgroundColor = backgroundColor
        additInfoLabel.text = additInfo
    }






}

//MARK: - Setup UI

private extension NameTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(wholeView)
        wholeView.addSubview(imageBackgroundView)
        imageBackgroundView.addSubview(imageIcon)
        wholeView.addSubview(nameLabel)
        wholeView.addSubview(additInfoLabel)
        wholeView.addSubview(chevronIcon)
        
        
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
        }
       
        imageBackgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(self.snp.height).multipliedBy(0.45)
            make.centerY.equalToSuperview()
        }
        imageIcon.snp.makeConstraints { make in
            make.center.equalTo(imageBackgroundView)
            make.size.equalTo(self.snp.height).multipliedBy(0.3)
        }
        

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(3)
            make.leading.equalTo(imageBackgroundView.snp.trailing).offset(18)
            make.trailing.equalTo(chevronIcon.snp.leading)
        }
        
        additInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(0)
            make.leading.equalTo(imageBackgroundView.snp.trailing).offset(18)
            make.bottom.equalToSuperview()
            make.trailing.equalTo(chevronIcon.snp.leading)

            
        }
        
        chevronIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.size.equalTo(self.snp.height).multipliedBy(0.3)
            make.centerY.equalToSuperview()
        }
        
       
    }
}

import UIKit

class DeleteButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        
        titleLabel?.textAlignment = .center
        setTitleColor(.systemRed, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
        layer.cornerRadius = 22
        layer.borderWidth = 1.0
        layer.borderColor = CGColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        configure(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        setTitle(title, for: .normal)
        backgroundColor = .white
        tintColor = .systemRed
    }
}

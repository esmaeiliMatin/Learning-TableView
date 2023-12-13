import UIKit

class DeleteButton: UIButton {
    
    init(title: String, iconName: String) {
        super.init(frame: .zero)
        
        var config = UIButton.Configuration.tinted()
        config.baseBackgroundColor = .white
        config.title = title
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
        config.image = UIImage(systemName: "door.right.hand.open")
        tintColor = .systemRed
        config.imagePadding = 8
        layer.cornerRadius = 22
        layer.borderWidth = 1.0
        layer.borderColor = CGColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        backgroundColor = .white
        self.configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

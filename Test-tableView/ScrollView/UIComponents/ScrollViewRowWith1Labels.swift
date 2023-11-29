import UIKit

class ScrollViewRowWith1Labels: UIView {
    // MARK: - Properties
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let icon = UIImageView()
    private let viewHeight = 82.0
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(frame: CGRect, model: ScrollViewRowWith1LabelsModel) {
        super.init(frame: frame)
        commonInit()
        newConfigure(model: model)
    }
    
    private func commonInit() {
        backgroundColor = .white
        
        addSubview(label)
        addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        setSize(height: viewHeight)
        
        label.alignAllEdgesWithSuperview(side: .topAndBottom, .init(top: 0, left: 0, bottom: 0, right: 0))
        label.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 80, bottom: 0, right: 0))
        label.setSize(width: 200)
        icon.setSize(width: 24, height: 24)
        icon.alignAllEdgesWithSuperview(side: .leading, .init(top: 0, left: 30, bottom: 0, right: 0))
        icon.alignAllEdgesWithSuperview(side: .top, .init(top: 29, left: 0, bottom: 0, right: 0))
        
    }
    
    // MARK: - Configuration
    
    func configure(with title: String, iconName: String, hasForwardArrow: Bool) {
        label.text = title
        icon.image = UIImage(systemName: iconName)
        icon.tintColor = .systemGray
        
        if hasForwardArrow {
            let icon2 = UIImageView(image: UIImage(systemName: "chevron.forward"))
            icon2.tintColor = .systemGray
            icon2.translatesAutoresizingMaskIntoConstraints = false
            addSubview(icon2)
            icon2.setSize(width: 8, height: 16)
            icon2.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -30))
            icon2.alignAllEdgesWithSuperview(side: .top, .init(top: 29, left: 0, bottom: 0, right: 0))
        }
    }
    
    func newConfigure(model: ScrollViewRowWith1LabelsModel) {
        label.text = model.title
        icon.image = UIImage(systemName: model.iconName)
        icon.tintColor = .systemGray
        
        if model.hasForwardArrow {
            let icon2 = UIImageView(image: UIImage(systemName: "chevron.forward"))
            icon2.tintColor = .systemGray
            icon2.translatesAutoresizingMaskIntoConstraints = false
            addSubview(icon2)
            icon2.setSize(width: 8, height: 16)
            icon2.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -30))
            icon2.alignAllEdgesWithSuperview(side: .top, .init(top: 29, left: 0, bottom: 0, right: 0))
        }
    }
}

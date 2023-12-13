import UIKit

class IconLabelChevronRow: BaseSettingsRow {
    
    // MARK: - Properties
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, model: SettingsRowDataModel) {
        super.init(frame: frame, model: model)
        addChevronIcon(model: model)
    }
    
    // MARK: - Configuration
    
    func addChevronIcon(model: SettingsRowDataModel) {
        let icon2 = UIImageView(image: UIImage(systemName: "chevron.forward"))
        icon2.tintColor = .systemGray
        addSubview(icon2)
        icon2.setSize(width: 8, height: 16)
        icon2.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -30))
        icon2.alignAllEdgesWithSuperview(side: .top, .init(top: 29, left: 0, bottom: 0, right: 0))
    }
}

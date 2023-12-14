import UIKit

class IconLabelChevronRow: BaseSettingsRow {
    
    private lazy var chevronIcon: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "chevron.forward"))
        view.tintColor = .systemGray
        return view
    }()
    
    override init(model: SettingModel) {
        super.init(model: model)
        
        addSubview(chevronIcon)
        chevronIcon.setSize(width: 8, height: 16)
        chevronIcon.alignAllEdgesWithSuperview(side: .trailing, .init(top: 0, left: 0, bottom: 0, right: -30))
        chevronIcon.alignAllEdgesWithSuperview(side: .top, .init(top: 29, left: 0, bottom: 0, right: 0))
    }
}

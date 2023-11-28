import UIKit

class customIcon: UIView {
    
    var name: String = ""
    var uiImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, test: String) {
        super.init(frame: frame)
        
        setupView()
        print(test)
    }
    
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: self.bounds.insetBy(dx: 1, dy: 1))
        let strokeColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        strokeColor.setStroke()
        circlePath.lineWidth = 1.0
        circlePath.stroke()
    }
    
    private func setupView() {
        backgroundColor = .white
        uiImageView.backgroundColor = .white
        addSubview(uiImageView)
        
        uiImageView.translatesAutoresizingMaskIntoConstraints = false
        
        uiImageView.setCenterAnchorToCenterOfSuperview(axis: .horizontal)
        uiImageView.setCenterAnchorToCenterOfSuperview(axis: .vertical)
    }
    
    func setImage(imageName: statusIconNames) {
        let image = UIImage(systemName: imageName.rawValue)
        uiImageView.image = image ?? UIImage()
    }
}

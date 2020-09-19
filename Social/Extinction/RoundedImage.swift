import UIKit

@IBDesignable
class RoundedImage: UIImageView {
    
    private var _isCircle:Bool = false
    
    @IBInspectable var isCircle:Bool = false {
        didSet {
            self._isCircle = isCircle
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat = 20{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setupCircleImage()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
        setupCircleImage()
    }
    
    private func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
    
    private func setupCircleImage(){
        if _isCircle {
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
        }else {
            setupView()
        }
    }
}

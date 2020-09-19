import UIKit
import AVFoundation
import AVKit
import Photos
extension UIViewController {
  
    func startIndicator(view:UIView) {
//    let loading: LoadingVC = LoadingVC.instantiateFromStoryboard()
        
        
       // view.addSubview(loading.view)
//
//        let storyboard = UIStoryboard.init(name: "LoadingGIF", bundle: nil)
//        let loading  = storyboard.instantiateViewController(withIdentifier: "LoadingVC")
//        //loading.modalPresentationStyle = .overCurrentContext
//        loading.modalPresentationStyle = .overFullScreen
//        loading.modalTransitionStyle = .crossDissolve
//
//        present(loading, animated: false)
        
    }
    
    func stopIndicator(view:UIView) {
         if let viewWithTag = self.view.viewWithTag(100) {
                    viewWithTag.removeFromSuperview()
        }
    }
    
    func presentDetails(_ viewControllerToPresent:UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition,forKey: kCATransition)
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func dismissDetails(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window?.layer.add(transition,forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
    
    func closeKeyboardWhenTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func closeKeyboard(){
        self.view.endEditing(true)
    }
    
  
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {

        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: -40, y: 0, width: newWidth, height: newHeight))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
    
    
}

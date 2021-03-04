import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero){
    translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
            if let leading = leading {
                self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
            }
            if let bottom = bottom {
                self.bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
            if let trailing = trailing {
                self.trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
            }
            
        }
    }
}

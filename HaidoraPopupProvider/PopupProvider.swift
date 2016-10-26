import UIKit
import Foundation
import ObjectiveC

/**
 *  具体的HUD(MBProgressHUD)需要实现该协议
 
 @see Popupabel
 */
public protocol PopupProvider {
    
    init()
    /// @see Popupabel.alert
    func alert(title: String,message: String,items: [String],action: @escaping (Int)->Void)
}

/// 用于配置默认的PopupProvider
public class PopupConfig {
    
    /// Popup提供者
    public var provider: PopupProvider.Type
    
    public class var shareInstance: PopupConfig {
        get {
            return Singleton.instance
        }
    }
    
    // MARK: private
    fileprivate init() {
        provider = HaidoraPopupProviderBuildIn.self
    }
    
    fileprivate struct Singleton {
        static let instance = PopupConfig()
    }
}

private struct AssociateKeys {
    static var action = "UIAlertView_AssociateKeys_action"
}

internal struct UIAlertViewBlockWrap {
    var action: ((Int)->Void)
}

extension UIAlertView: UIAlertViewDelegate {
    
    internal var action: UIAlertViewBlockWrap? {
        get {
            return objc_getAssociatedObject(self, &AssociateKeys.action) as? UIAlertViewBlockWrap
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.action, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if let action = action {
            action.action(buttonIndex)
        }
    }
}

internal struct HaidoraPopupProviderBuildIn: PopupProvider {
    
    func alert(title: String, message: String, items: [String], action: @escaping (Int) -> Void) {
        let alert = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: nil)
        for item in items {
            alert.addButton(withTitle: item)
        }
        alert.action = UIAlertViewBlockWrap(action: action)
        alert.delegate = alert
        alert.show()
    }
}

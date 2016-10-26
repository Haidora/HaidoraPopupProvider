import UIKit
import MMPopupView

public class MMPopupViewSwiftWrap: PopupProvider {
    
    var hud: MMPopupView?
    
    public required init () {}
    
    public func alert(title: String, message: String, items: [String], action: @escaping (Int) -> Void) {
        var buttonItems = [MMPopupItem]()
        for buttonTitle in items {
            let item = MMPopupItem()
            item.title = buttonTitle
            item.handler = action
            buttonItems.append(item)
        }
        hud = MMAlertView(title: title, detail: message, items: buttonItems)
        hud?.show()
    }
}

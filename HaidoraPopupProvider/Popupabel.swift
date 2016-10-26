import UIKit
import Foundation
import ObjectiveC

/**
 统一弹框方式(可针对该协议做扩展,扩展需要和**PopupProvider**配合)
 */
public protocol Popupabel: class {
    
    /// 用于配置Popup Provider,默认为空
    var popupProvider: PopupProvider.Type? { get }
}

// MARK: Popupabel-DefaultImp
extension Popupabel {
    
    /// 用于配置Popup Provider,默认为空
    public var popupProvider: PopupProvider.Type? {
        return nil
    }
}

// MARK: HaidoraStatusable-convenience
extension Popupabel {
    
    /// helper
    public func buildProvider() -> PopupProvider {
        var providerType: PopupProvider.Type?
        if self.popupProvider == Optional.none {
            providerType = PopupConfig.shareInstance.provider
        }
        else {
            providerType = self.popupProvider
        }
        let provider = providerType!.init()
        return provider
    }
    
    public func alert(title: String = "title",message: String,items: String...,action: @escaping (Int)->Void = { _ in }) {
        let popupView = self.buildProvider()
        popupView.alert(title: title, message: message, items: items, action: action)
    }
}

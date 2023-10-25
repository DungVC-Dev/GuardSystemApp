//
//  CommonAlertView.swift
//  GuardSystemApp
//
//  Created by Công Dũng on 26/10/2023.
//

import SwiftUI

protocol AlertObject: ObservableObject {
    var alert: AlertViewObject? { get }
}

public enum AlertViewObjectType {
    case alert
    case confirm
}

public enum AlertButtonStyleViewObject {
    case destructive
    case cancel
    case normal
}

public struct AlertViewObject: Identifiable {
    public var id: UUID { UUID() }

    public let type: AlertViewObjectType
    public let title: String
    public let message: String?
    public let titlePrimary: String?
    public let titleSecondary: String?
    public let primaryButtonStyle: AlertButtonStyleViewObject
    public let secondaryButtonStyle: AlertButtonStyleViewObject

    public var primaryAction: (() -> Void)?
    public var secondaryAction: (() -> Void)?

    public init(
        title: String,
        message: String? = nil,
        titlePrimary: String? = nil,
        titleSecondary: String,
        primaryButtonStyle: AlertButtonStyleViewObject = .normal,
        secondaryButtonStyle: AlertButtonStyleViewObject = .normal
    ) {
        self.type = titlePrimary != nil ? .confirm : .alert
        self.title = title
        self.message = message
        self.titlePrimary = titlePrimary
        self.titleSecondary = titleSecondary
        self.primaryButtonStyle = primaryButtonStyle
        self.secondaryButtonStyle = secondaryButtonStyle
    }
}

struct AlertViewModifier: ViewModifier {
    @Binding var alert: AlertViewObject?

    func body(content: Content) -> some View {
        content
            .alert(
                alert?.title ?? "",
                isPresented: .constant(alert != nil),
                actions: {
                    if alert?.type == .confirm {
                        Button(
                            alert?.titlePrimary ?? "",
                            role: mapToButtonRole(style: alert?.primaryButtonStyle)
                        ) {
                            alert?.primaryAction?()
                            alert = nil
                        }
                    }
                    Button(
                        alert?.titleSecondary ?? "",
                        role: mapToButtonRole(style: alert?.secondaryButtonStyle)
                    ) {
                        alert?.secondaryAction?()
                        alert = nil
                    }
                    .keyboardShortcut(.defaultAction)
                }, message: {
                    Text(alert?.message ?? "")
                }
            )
    }

    private func mapToButtonRole(style: AlertButtonStyleViewObject?) -> ButtonRole? {
        switch style {
        case .destructive:
            return .destructive
        case .cancel:
            return .cancel
        default:
            return nil
        }
    }
}

public extension View {
    func onViewAlert(with alert: Binding<AlertViewObject?>) -> some View {
        self.modifier(AlertViewModifier(alert: alert))
    }
}

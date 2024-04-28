//
//  NotificationManagerr.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import Combine
import SwiftUI

final class NotificationManager {
    let toastsPublisher = CurrentValueSubject<[ToastItem], Never>([])
    
    func present(title: String,
                 symbol: Image = Image(systemName: "exclamationmark.circle")) {
        let toasts = toastsPublisher.value
        let newToast = ToastItem(title: title, symbol: symbol)
        toastsPublisher.send(toasts + [newToast])
    }
    
    func removeToast(item: ToastItem) {
        let toasts = toastsPublisher.value.filter({ $0.id != item.id })
        toastsPublisher.send(toasts)
    }
}

struct ToastItem: Identifiable {
    let id: UUID = .init()
    var title: String
    var symbol: Image
    let tint: Color = .text
    let isUserInteractionEnabled: Bool = true
    let timing: CGFloat = 2.0
}

//
//  Publisher+Utils.swift
//  SwiftUI-MVVM-C

import Combine

extension Publisher {
    func optionalize() -> Publishers.Map<Self, Self.Output?> {
        map({ Optional.some($0) })
    }
}

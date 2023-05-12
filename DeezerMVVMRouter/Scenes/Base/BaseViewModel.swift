//
//  BaseViewModel.swift
//  DeezerMVVMRouter
//
//  Created by cihan on 13.05.23.
//

import Foundation
import Utilities
protocol BaseViewModelDataSource: AnyObject {
}

protocol BaseViewModelEventSource: AnyObject {

    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
}

class BaseViewModel: BaseViewModelProtocol {

    // MARK: - Loading
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?

    #if DEBUG || DEVELOP
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}

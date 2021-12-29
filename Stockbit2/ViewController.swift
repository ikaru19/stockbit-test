//
//  ViewController.swift
//  Stockbit2
//
//  Created by Engineering on 29/12/21.
//
//

import UIKit
import SnapKit
import Alamofire
import RxSwift
import RxAlamofire
import Cleanse

class ViewController: UIViewController {
    private var disposeBag = DisposeBag()
    private var getTopListUseCase: GetTopListUseCase?
    override func viewDidLoad() {
        super.viewDidLoad()
        initDesign()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        (UIApplication.shared.delegate as? ProvideInjectorResolver)?.injectorResolver.inject(self)
    }

    func injectProperties(
            viewController: TaggedProvider<StockbitBaseUrl>,
            getTopListUseCase: GetTopListUseCase
    ) {
        self.getTopListUseCase = getTopListUseCase
    }
}

extension ViewController {
    func initDesign() {
        generateBaseView()
    }

    func generateBaseView() {
        view.backgroundColor = .red
    }
}
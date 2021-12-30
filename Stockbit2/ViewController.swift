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
import Lottie

class ViewController: UIViewController {
    private var disposeBag = DisposeBag()
    private var avSticker: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initDesign()
        initViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        (UIApplication.shared.delegate as? ProvideInjectorResolver)?.injectorResolver.inject(self)
        goToTopList()
    }

    func goToTopList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if let vc = (UIApplication.shared.delegate as? ProvideViewControllerResolver)?.vcResolver.instantiateTopListViewController().get() {
                guard let navigationController = self.navigationController else { return }
                navigationController.pushViewController(vc, animated: true)
                navigationController.viewControllers.remove(at: navigationController.viewControllers.count - 2)
            }
        }
    }

    func injectProperties(
            viewController: TaggedProvider<StockbitBaseUrl>
    ) {
        //Test Purpose Only
    }
}

extension ViewController {
    func initDesign() {
        generateBaseView()
        let avSticker = generateStickerAnimationDesign()

        view.addSubview(avSticker)

        avSticker.snp.makeConstraints { make in
           make.center.equalToSuperview()
           make.height.equalTo(256)
           make.width.equalTo(256)
        }

        self.avSticker = avSticker
    }

    private func generateStickerAnimationDesign() -> AnimationView {
        let view = AnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }

    func generateBaseView() {
        view.backgroundColor = .white
    }
}

extension ViewController {
    func initViews() {
        self.avSticker?.animation = Animation.named("splash")
        self.avSticker?.loopMode = .loop
        self.avSticker?.animationSpeed = 0.5
        self.avSticker?.play()
    }
}
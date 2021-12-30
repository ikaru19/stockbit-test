//
// Created by Engineering on 30/12/21.
//

import Foundation
import RxSwift
import RxRelay

class GetNewsLastestViewModelImpl: GetNewsLastestViewModel {
    private var _errors: PublishRelay<Error> = PublishRelay()
    private var _newsList: PublishRelay<[Domain.News]> = PublishRelay()

    private var getLastestNewsUseCase: GetLastestNewsUseCase
    private var disposeBag = DisposeBag()

    var errors: Observable<Error> {
        _errors.asObservable()
    }

    var newsList: Observable<[Domain.News]> {
        _newsList.asObservable()
    }

    init(getLastestNewsUseCase: GetLastestNewsUseCase) {
        self.getLastestNewsUseCase = getLastestNewsUseCase
    }

    func getNews(category: String) {
        getLastestNewsUseCase.execute(category: category).subscribe(
                onSuccess: { [weak self] data in
                    self?._newsList.accept(data)
                }, onError: { [weak self] error in
                    self?._errors.accept(error)
                })
    }
}

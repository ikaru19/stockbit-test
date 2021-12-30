//
// Created by Engineering on 30/12/21.
//

import Foundation
import RxSwift
import RxRelay

class GetTopListViewModelImpl: GetTopListViewModel {
    private var _errors: PublishRelay<Error> = PublishRelay()
    private var _topLists: PublishRelay<[Domain.Toplist]> = PublishRelay()
    private var getTopListUseCase: GetTopListUseCase
    private var disposeBag = DisposeBag()

    var errors: Observable<Error> {
        _errors.asObservable()
    }

    var topLists: Observable<[Domain.Toplist]> {
        _topLists.asObservable()
    }

    init(getTopListUseCase: GetTopListUseCase) {
        self.getTopListUseCase = getTopListUseCase
    }

    func refreshPage() {
    }

    func getTopLists(limit: Int) {
        getTopListUseCase.execute(limit: limit).subscribe(
                onSuccess: { [weak self] data in
                    self?._topLists.accept(data)
                }, onError: { [weak self] error in
                    self?._errors.accept(error)
                })
    }
}
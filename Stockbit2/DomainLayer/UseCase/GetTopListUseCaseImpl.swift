//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift

class GetTopListUseCaseImpl: GetTopListUseCase {
    private var topListRemoteDataSource: TopListRemoteDataSource

    init(topListRemoteDataSource: TopListRemoteDataSource) {
        self.topListRemoteDataSource = topListRemoteDataSource
    }
    func execute(limit: Int) -> Single<Domain.Toplist?> {
        Single.just(nil)
    }
}
//
// Created by Engineering on 29/12/21.
//

import Foundation
import RxSwift
import Alamofire

class GetTopListUseCaseImpl: GetTopListUseCase {
    private var topListRemoteDataSource: TopListRemoteDataSource
    private var disposeBag = DisposeBag()

    init(topListRemoteDataSource: TopListRemoteDataSource) {
        self.topListRemoteDataSource = topListRemoteDataSource
    }

    func execute(limit: Int) -> Single<[Domain.Toplist]> {
        Single.create(subscribe: { [weak self] observer in
            self?.topListRemoteDataSource.getTopListRemoteDataSource(limit: limit)
                    .subscribe(
                            onNext: { [weak self] data in
                                var topListData : [Domain.Toplist] = []
                                if let dict = data as? [String: AnyObject],
                                   let dictData = dict["Data"] as? [[String:Any]] {
                                    let processedData = self?.rawDataMapper(dictionary: dictData)
                                    topListData.append(contentsOf: processedData ?? [])
                                }
                                observer(.success(topListData))
                            },
                            onError: { [weak self] error in
                                observer(.error(error))
                            }
                    )
            return Disposables.create()
        })
    }
}

private extension GetTopListUseCaseImpl {
    func rawDataMapper(dictionary: [[String:Any]]) -> [Domain.Toplist] {
        var topListData : [Domain.Toplist] = []

        for processed in dictionary {
            if let display = processed["CoinInfo"] as? [String: Any],
               let raw = processed["RAW"] as? [String: Any],
               let usd = raw["USD"] as? [String: Any] {
                let data = Domain.Toplist(
                        fullName: display["FullName"] as? String,
                        name: display["Name"] as? String,
                        change: usd["CHANGE24HOUR"] as? Double,
                        changePercentage: usd["CHANGEPCT24HOUR"] as? Double,
                        price: usd["PRICE"] as? Double
                )
                topListData.append(data)
            }
        }

        return topListData
    }
}
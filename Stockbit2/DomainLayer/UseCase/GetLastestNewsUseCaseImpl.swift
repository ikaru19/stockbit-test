//
// Created by Engineering on 30/12/21.
//

import Foundation
import RxSwift
import Alamofire

class GetLastestNewsUseCaseImpl: GetLastestNewsUseCase {
    private var newsRemoteDataSource: NewsRemoteDataSource
    private var disposeBag = DisposeBag()

    init(newsRemoteDataSource: NewsRemoteDataSource) {
        self.newsRemoteDataSource = newsRemoteDataSource
    }

    func execute(category: String) -> Single<[Domain.News]> {
        Single.create(subscribe: { [weak self] observer in
            self?.newsRemoteDataSource.getLastestNews(category: category)
                    .subscribe(
                            onNext: { [weak self] data in
                                var newsData : [Domain.News] = []
                                if let dict = data as? [String: AnyObject],
                                   let dictData = dict["Data"] as? [[String:Any]] {
                                    let processedData = self?.rawDataMapper(dictionary: dictData)
                                    newsData.append(contentsOf: processedData ?? [])
                                }
                                observer(.success(newsData))
                            },
                            onError: { [weak self] error in
                                observer(.error(error))
                            }
                    )
            return Disposables.create()
        })
    }
}

private extension GetLastestNewsUseCaseImpl {
    func rawDataMapper(dictionary: [[String: Any]]) -> [Domain.News] {
        var newsData: [Domain.News] = []
        for processed in dictionary {
            if let src = processed["source_info"] as? [String: Any] {
                let data = Domain.News(
                        title: processed["title"] as? String,
                        body: processed["body"] as? String,
                        source: src["name"] as? String
                )
                newsData.append(data)
            }
        }
        return newsData
    }
}
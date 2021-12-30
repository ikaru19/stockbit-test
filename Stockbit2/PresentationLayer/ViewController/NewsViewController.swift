//
// Created by Engineering on 30/12/21.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class NewsViewController: UIViewController {
    private var tvContent: UITableView?
    private let viewModel: GetNewsLastestViewModel

    private var newsList: [Domain.News] = []

    private var newsSubscriber: Disposable?
    private var errorSubscriber: Disposable?

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: GetNewsLastestViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initDesign()
        initViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeViewModel()
    }

    func getNews(category: String) {
        viewModel.getNews(category: category)
    }

    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeViewModel()
        super.viewWillDisappear(animated)
    }

    private func subscribeViewModel() {
        newsSubscriber = viewModel.newsList
                .observeOn(MainScheduler.instance)
                .subscribe(
                        onNext: { [weak self] news in
                            DispatchQueue.main.async {
                                self?.initNews(news)
                            }
                        }
                )

        errorSubscriber = viewModel.errors
                .observeOn(MainScheduler.instance)
                .subscribe(
                        onNext: { [weak self] error in
                            DispatchQueue.main.async {
                                self?.handleError(error)
                            }
                        }
                )
    }

    private func unsubscribeViewModel() {
        newsSubscriber?.dispose()
        newsSubscriber = nil
        errorSubscriber?.dispose()
        errorSubscriber = nil
    }

    private func initNews(_ news: [Domain.News]) {
        self.newsList = news
        tvContent?.reloadData()
    }
}

private extension NewsViewController {
    func initDesign() {
        setupBaseView()
        let tvContent = generateTableView()

        view.addSubview(tvContent)
        tvContent.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }

        self.tvContent = tvContent
    }

    func setupBaseView() {
        view.backgroundColor = .white
        self.navigationItem.title = "News"
    }

    func generateTableView() -> UITableView {
        let view = UITableView(frame: .zero,style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

// MARK: UIKIT
private extension NewsViewController {
    func initViews() {
        initTableView()
    }

    func initTableView() {
        tvContent?.register(
                NewsTableCell.self,
                forCellReuseIdentifier: NewsTableCell.identifier
        )
        self.tvContent?.delegate = self
        self.tvContent?.dataSource = self
    }
}

// MARK: TABLE DELEGATE
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NewsTableCell.identifier, for: indexPath
        ) as? NewsTableCell else {
            return UITableViewCell()
        }
        cell.updateUI(data: newsList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

private extension NewsViewController {
    func handleError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
//
// Created by Engineering on 29/12/21.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class TopListViewController: UIViewController {
    private var tvContent: UITableView?
    private let viewModel: GetTopListViewModel

    private var topLists: [Domain.Toplist] = []

    private var topListsSubscriber: Disposable?
    private var errorSubscriber: Disposable?

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: GetTopListViewModel) {
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
        initEvents()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        subscribeViewModel()
        viewModel.getTopLists(limit: 50)
    }

    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeViewModel()

        super.viewWillDisappear(animated)
    }

    private func subscribeViewModel() {
        viewModel.delegate = self
        topListsSubscriber = viewModel.topLists
                .observeOn(MainScheduler.instance)
                .subscribe(
                        onNext: { [weak self] topLists in
                            DispatchQueue.main.async {
                                self?.initTopList(topLists)
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
        topListsSubscriber?.dispose()
        topListsSubscriber = nil
        errorSubscriber?.dispose()
        errorSubscriber = nil
    }
}

extension TopListViewController: TopListViewModelDelegate{
    internal func onFinishFetch() {
        DispatchQueue.main.async {
            self.tvContent?.cr.endHeaderRefresh()
        }
    }
}

private extension TopListViewController {
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
        self.navigationItem.title = "Toplists"
    }

    func generateTableView() -> UITableView {
        let view = UITableView(frame: .zero,style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

private extension TopListViewController {
    func initViews() {
        initTableView()
    }

    func initTableView() {
        tvContent?.register(
                TopListTableCell.self,
                forCellReuseIdentifier: TopListTableCell.identifier
        )
        self.tvContent?.delegate = self
        self.tvContent?.dataSource = self
        initPullToRefresh()
    }

    private func initPullToRefresh() {
        tvContent?.cr.addHeadRefresh(animator: PullToRefreshAnimator()) { [weak self] in
            self?.viewModel.refreshPage()
        }
    }
}

extension TopListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topLists.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TopListTableCell.identifier, for: indexPath
        ) as? TopListTableCell else {
            return UITableViewCell()
        }
        cell.updateUI(data: topLists[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = (UIApplication.shared.delegate as? ProvideViewControllerResolver)?.vcResolver.instantiateNewsViewController().get(),
           let name = topLists[indexPath.row].name  {
            guard let navigationController = self.navigationController else { return }
            vc.getNews(category: name)
            navigationController.present(UINavigationController(rootViewController:vc), animated: true)
        }
    }

    private func initTopList(_ topList: [Domain.Toplist]) {
        self.topLists = topList
        tvContent?.reloadData()
    }
}

private extension TopListViewController {
    func initEvents() {

    }

    func handleError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
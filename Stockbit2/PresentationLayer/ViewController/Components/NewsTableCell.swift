//
// Created by Engineering on 30/12/21.
//

import Foundation
import UIKit
import SnapKit

class NewsTableCell: UITableViewCell {
    public static let identifier: String = "NewsTableCell"
    private var vwContainer: UIView?
    private var lbSource: UILabel?
    private var lbTitle: UILabel?
    private var lbBody: UILabel?

    private var item: Domain.News?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initDesign()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initDesign()
    }

    func updateUI(data: Domain.News) {
        lbSource?.text = data.source
        lbBody?.text = data.body
        lbTitle?.text = data.title
    }
}

private extension NewsTableCell {
    func initDesign() {
        let vwContainer = generateContainer()
        let lbSource = generateSourceLabel()
        let lbTitle = generateTitle()
        let lbBody = generateBody()

        self.contentView.addSubview(vwContainer)
        vwContainer.addSubview(lbSource)
        vwContainer.addSubview(lbTitle)
        vwContainer.addSubview(lbBody)

        vwContainer.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }

        lbSource.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(vwContainer).offset(8)
            make.leading.equalTo(vwContainer).offset(16)
        }

        lbTitle.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(lbSource.snp.bottom).offset(4)
            make.leading.equalTo(vwContainer).offset(16)
            make.trailing.equalTo(vwContainer).offset(-16)
        }

        lbBody.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(lbTitle.snp.bottom).offset(4)
            make.leading.equalTo(vwContainer).offset(16)
            make.bottom.trailing.equalTo(vwContainer).offset(-16)

        }

        self.vwContainer = vwContainer
        self.lbSource = lbSource
        self.lbBody = lbBody
    }

    func generateContainer() -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    func generateSourceLabel() -> UILabel {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return view
    }

    func generateTitle() -> UILabel {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.numberOfLines = 0
        return view
    }

    func generateBody() -> UILabel {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        view.numberOfLines = 0
        return view
    }
}
//
// Created by Engineering on 30/12/21.
//

import Foundation
import UIKit
import SnapKit

class TopListTableCell: UITableViewCell {
    public static let identifier: String = "TopListTableCell"
    private var vwContainer: UIView?
    private var lbFullName: UILabel?
    private var lbName: UILabel?
    private var lbPrice: UILabel?
    private var vwPercentage: UIView?
    private var lbPercentage: UILabel?

    private var item: Domain.Toplist?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initDesign()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initDesign()
    }

    func initComponents() {
        initDesign()
    }

    func updateUI(data: Domain.Toplist) {
        guard let percent = data.changePercentage,
              let price = data.price,
              let lastPrice = data.change else {
            return
        }
        self.item = data
        lbFullName?.text = data.fullName
        lbName?.text = data.name
        let doublePercent = String(format: "%.2f", percent)
        let doubleLast = String(format: "%.2f", lastPrice)
        var doublePrice = ""
        if price > 1 {
            doublePrice = String(format: "%.2f", price)
        } else {
            doublePrice = String(format: "%.4f", price)
        }

        lbPercentage?.text = "\(doubleLast) ( \(doublePercent) % )"
        lbPrice?.text = "$ \(doublePrice)"
        if percent.sign == .minus {
            vwPercentage?.backgroundColor = .red
        } else {
            vwPercentage?.backgroundColor = .systemGreen
        }
    }
}

private extension TopListTableCell {
    func initDesign() {
        let vwContainer = generateContainer()
        let lbFullName = generateFullNameLabel()
        let lbName = generateNameLabel()
        let lbPrice = generatePriceLabel()
        let vwPercentage = generatePercentageContainer()
        let lbPercentage = generatePercetageLabel()

        self.contentView.addSubview(vwContainer)
        vwContainer.addSubview(lbFullName)
        vwContainer.addSubview(lbName)
        vwContainer.addSubview(lbPrice)
        vwContainer.addSubview(vwPercentage)
        vwPercentage.addSubview(lbPercentage)

        vwContainer.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }

        lbFullName.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(vwContainer).offset(8)
            make.leading.equalTo(vwContainer).offset(16)
        }

        lbName.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(vwContainer.snp.centerY).offset(4)
            make.leading.equalTo(lbFullName)
            make.bottom.equalTo(vwContainer).offset(-8)
        }

        lbPrice.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(vwContainer).offset(8)
            make.trailing.equalTo(vwContainer).offset(-16)
        }

        vwPercentage.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(vwContainer.snp.centerY).offset(4)
            make.trailing.equalTo(lbPrice)
            make.bottom.equalTo(vwContainer).offset(-8)
        }

        lbPercentage.snp.makeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalTo(vwPercentage).offset(4)
            make.trailing.equalTo(vwPercentage).offset(-4)
            make.top.equalTo(vwPercentage).offset(2)
            make.bottom.equalTo(vwPercentage).offset(-2)
        }

        self.vwContainer = vwContainer
        self.lbFullName = lbFullName
        self.lbName = lbName
        self.lbPrice = lbPrice
        self.lbPercentage = lbPercentage
        self.vwPercentage = vwPercentage
    }

    func generateContainer() -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    func generatePercentageContainer() -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6.0
        view.layer.masksToBounds = true
        view.backgroundColor = .systemGreen
        return view
    }

    func generateFullNameLabel() -> UILabel {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }

    func generateNameLabel() -> UILabel {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .light)
        view.textColor = .gray
        return view
    }

    func generatePriceLabel() -> UILabel {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }

    func generatePercetageLabel() -> UILabel {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .light)
        view.textColor = .white
        return view
    }
}
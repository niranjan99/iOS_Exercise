//
//  DataViewController.swift
//  iOS_Exercise
//
//  Created by Niranjan on 20/06/20.
//  Copyright © 2020 Niranjan. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

     var viewModel = FactsViewModel()
     let contactsTableView = UITableView()
     var refreshControl = UIRefreshControl()
     var activityView = UIActivityIndicatorView()
      override func viewDidLoad() {
         super.viewDidLoad()
         setupView()
     }
    func setupView(){
        initTableView()
        showActivityIndicator()
        viewModel.loadData()
        reloadTableView()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        contactsTableView.addSubview(refreshControl)
        
    }
   @objc func refresh(_ sender: AnyObject) {
         viewModel.loadData()
      }
   func reloadTableView() {
          viewModel.reloadList = { [weak self] ()  in
              DispatchQueue.main.async {
               self?.hideActivityIndicator()
               self?.refreshControl.endRefreshing()
               self?.contactsTableView.reloadData()
               self?.title = self?.viewModel.feedData?.title
              }
          }
      }

   func initTableView(){
         view.addSubview(contactsTableView)
         contactsTableView.translatesAutoresizingMaskIntoConstraints = false
         contactsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
         contactsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
         contactsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
         contactsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
         contactsTableView.register(DataTableViewCell.self, forCellReuseIdentifier: "DataTableCell")
         contactsTableView.delegate = self
         contactsTableView.dataSource = self

   }
   func showActivityIndicator() {
       activityView = UIActivityIndicatorView(style: .large)
       activityView.center = view.center
       activityView.hidesWhenStopped = true
       activityView.startAnimating()
       contactsTableView.addSubview(activityView)
   }

   func hideActivityIndicator(){
           activityView.stopAnimating()
   }
  }
    extension DataViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return UITableView.automaticDimension
            }
    }

    extension DataViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.feedData?.rows?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableCell", for: indexPath) as! DataTableViewCell
            cell.setData = viewModel.feedData?.rows?[indexPath.row]
            return cell
        }

}


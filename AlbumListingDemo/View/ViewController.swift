//
//  ViewController.swift
//  AlbumDemoApp
//
//  Created by Neel on 11/27/24.
//

import Combine
import UIKit

class ViewController: UIViewController {
    
    var viewModel = ViewModel(apiService: APIService())
    
    private var cancellable: AnyCancellable?
    
    @IBOutlet var tblAlbumList: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblAlbumList?.register(AlbumListTableViewCell.self, forCellReuseIdentifier: "AlbumListTableViewCell")
        
        viewModel.fetchAlbumList()
        
        cancellable = viewModel.$model.sink { [weak self] _ in
            DispatchQueue.main.async {
                self?.tblAlbumList?.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
    
    deinit {
        cancellable?.cancel()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItem
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumListTableViewCell", for: indexPath) as? AlbumListTableViewCell
        cell?.selectionStyle = .none
        cell?.setCellData(item: viewModel.item(at: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedImage = viewModel.item(at: indexPath.row)
        let fullImageVC = FullImageViewController(imageUrl: selectedImage.url)
        self.present(fullImageVC, animated: true)
    }
}


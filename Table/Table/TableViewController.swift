//
//  TableViewController.swift
//  Table
//
//  Created by 서희찬 on 2022/03/08.
//

import UIKit

var items = ["책 구매","희찬와 약속","알고리즘 스터디 준비하기"]
var itemsImageFile = ["cart.png","clock.png","pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem // 왼쪽에 edit 버튼 만들기
    }
    
    // 뷰가 전환될 때 호출되는 함수, 리스트가 추가되어 Main View로 돌아올때 호출되며 추가된 내용을 리스트에 보여준다.
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() // 추가된 목록을 불러들인다.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // 보통 테이블 안에 섹션 1개 이므로 리턴 1을 한다.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count //섹션당 열의 개수는 items의 개수이다.
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row] // 셀의 텍스트 레이블에 items대입
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row]) // 이미지뷰에 사진 대입

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //삭제버튼 이름수정
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    //삭제 구현 함수
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // 목록 옮기기 함수
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        // 이동할 아이템의 위치 저장 변수
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        
        // 이동할 아이템 삭제, 삭제한 아이템 뒤의 인덱스 재정렬 됨
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        
        // 삭제된 아이템을 이동할 위치로 삽입, 삽입한 아이템 뒤의 아이템들의 인덱스 재정렬
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "sgDetail"{
                let cell = sender as! UITableViewCell
                let indexPath = self.tvListView.indexPath(for: cell)
                let detailView = segue.destination as! DetailViewController
                detailView.receiveItems(items[((indexPath! as NSIndexPath).row)])
            }
    }
}

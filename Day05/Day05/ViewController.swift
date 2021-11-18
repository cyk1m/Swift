//
//  ViewController.swift
//  Day55
//
//  Created by Alicia Lim on 2021/11/09.
//

import UIKit
import SQLite3

//var total2 : UILabel?
//var value = 100

class ViewController: UIViewController {

    @IBOutlet var noText  :  UITextField!
    @IBOutlet var nameText  :  UITextField!
    @IBOutlet var queryResult  :  UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        total2 = queryResult
        let cal = BasicCal()
        cal.prints()
    }


    @IBAction func insertBtn(_ sender: UIButton) {
        let db = SQLite3DB()
        let no = Int32(noText.text!)!
        let name = NSString(utf8String: nameText.text!)!
        print("id>> ", no, " name: ", name)
        db.insert(id: no, name: name)
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        let db = SQLite3DB()
        let no = Int32(noText.text!)!
        print("id>> ", no)
        db.delete(id: no)
    }
    
    
    @IBAction func dbStartBtn(_ sender: UIButton) {
        let db = SQLite3DB()
       // print("fm값은 ", db.fm)
        print("생성된 path는 ", db.path)
        //db.openDatabase()
        db.createTable()
    }
    //mega.db를 만들어보고, bbs(id-pk, title, content, writer) table생성
    //sqlite3 mega.db로 접속해서
    //bbs instance를 한 줄 넣어서, 검색!
    
    @IBAction func queryBtn(_ sender: UIButton) {
        let db = SQLite3DB()
        db.query()
    }
    
    
}

class SQLite3DB{
    //자바에서는 File
    //swift에서는 FileManager
//    let fm = FileManager.default
//    let path = fm.urls(for: .libraryDirectory, in: .userDomainMask).last!
//        .appendingPathComponent("company.db").path
    
    let path: String = {
          let fm = FileManager.default
//            print("fm", fm)
//            print(fm.urls(for:.libraryDirectory, in:.userDomainMask).last!
//                    .appendingPathComponent("ToDo3.db").path)
          return fm.urls(for:.libraryDirectory, in:.userDomainMask).last!
                   .appendingPathComponent("company.db").path
    }()
    
    
    //가상 기계의 경로(폴더+파일)를 가지고 와서, 여기에 sqlite db를 생성해야함.
    
    
    //db연결하는 함수
    func openDatabase() -> OpaquePointer? {
        var con : OpaquePointer? = nil
        //Connection con = DriverManager.getConnection(url, id, pw);
        if sqlite3_open(path, &con) == SQLITE_OK {
            print("연결 성공")
        }else{
            print("연결 실패")
        }
        return con
    }
    
    //table만드는 함수
    let sql_create =
    """
    create table contact (
    id int primary key not null,
    name char(255)
    );
    """
    let sql_create2 = """
    create table bbs (
    id int primary key not null,
    title varchar(255),
    content varchar(255),
    writer char(255)
    );
    """
    func createTable(){
          let db = openDatabase()
          var con : OpaquePointer? = nil
          //sql문 객체화, 실행
          if sqlite3_prepare_v2(db, sql_create, -1, &con, nil) == SQLITE_OK {
              print("sql문 객체화 성공")
              if sqlite3_step(con) == SQLITE_DONE{
                  print("테이블 생성 성공.")
              }else{
                  print("테이블 생성 실패.")
            }
        }else{
            print("sql문 객체화 실패")
        }
        //실행이 성공하면 테이블이 생성되었습니다.
        sqlite3_finalize(con)
    }
    
    
    //insert하는 함수
    let sql_insert = "insert into contact values (?, ?);"
    func insert(id : Int32, name: NSString){
        let db = openDatabase()
        var con : OpaquePointer? = nil
        //sql문 객체화, 실행
        if sqlite3_prepare_v2(db, sql_insert, -1, &con, nil) == SQLITE_OK {
            
            sqlite3_bind_int(con, 1, id)
            sqlite3_bind_text(con, 2, name.utf8String, -1, nil)
            
            print("sql문 객체화 성공")
            if sqlite3_step(con) == SQLITE_DONE{
                print("회원 가입 성공.")
            }else{
                print("회원 가입 실패.")
          }
      }else{
          print("sql문 객체화 실패")
      }
      //실행이 성공하면 테이블이 생성되었습니다.
      sqlite3_finalize(con)
    }
    
    //delete하는 함수
    let sql_delete = "delete from contact where id = ?;"
    func delete(id : Int32){
        let db = openDatabase()
        var con : OpaquePointer? = nil
        //sql문 객체화, 실행
        if sqlite3_prepare_v2(db, sql_delete, -1, &con, nil) == SQLITE_OK {
            
            sqlite3_bind_int(con, 1, id)
           
            print("sql문 객체화 성공")
            if sqlite3_step(con) == SQLITE_DONE{
                print("회원 탈퇴 성공.")
            }else{
                print("회원 탈퇴 실패.")
          }
      }else{
          print("sql문 객체화 실패")
      }
      
      sqlite3_finalize(con)
    }
    
    //select하는 함수
        let sql_query = "select * from contact;"
        func query(){
    //        total2?.text = "안녕\n안녕\n"
    //        print(total2?.text!)
            let db = openDatabase()
            var con : OpaquePointer? = nil
            //sql문 객체화, 실행
            if sqlite3_prepare_v2(db, sql_query, -1, &con, nil) == SQLITE_OK {
                print("sql문 객체화 성공")
                var result = "" //검색 결과를 하나의 String으로 모아주기 위한 변수
                while sqlite3_step(con) == SQLITE_ROW{
                    print("회원 검색 성공.")
                    let id = sqlite3_column_int(con, 0)
                    let n = sqlite3_column_text(con, 1)
                    let name = String(cString: n!)
                    var row = "id: " + String(id) + ", name: " + name
                    print("row>> " , row)
                    result.append(row + "\n")
                }
                print("result>> \n", result)
                total2?.text = result
          }else{
              print("sql문 객체화 실패")
          }
          
       
            
          sqlite3_finalize(con)
            
        }
}

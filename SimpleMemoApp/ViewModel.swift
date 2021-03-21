
//メモの追加、更新、削除等のクラス

import Foundation

final class ViewModel {
    
    private let repository: MemoRepository
    //デコードされたメモ一覧
    private(set) var currentMemos: [MemoData] {
        //値が更新されるたび保存するための処理
        didSet {
            
            repository.save(memos: currentMemos)
        }
    }
    
    //初期化
    init() {
        repository = MemoRepository()
        currentMemos = repository.allMemos()
    }
    
    //デコードされたメモ一覧に新たなメモを追加するメソッド
    func add(memo: MemoData) {
        
        currentMemos.append(memo)
    }
    
    //指定したメモを削除するメソッド
    func deleteMemo(for id: String) {
        
        guard let index = currentMemos.firstIndex(where: { $0.id == id }) else {
            
            return
        }
        currentMemos.remove(at: index)
    }
    
    //変更したメモを上書きするメソッド
    func updateMemo(for id: String, to newMemo: MemoData) {
        
        guard let index = currentMemos.firstIndex(where: { $0.id == id }) else {
            
            return
        }
        currentMemos[index] = newMemo
    }
    
}

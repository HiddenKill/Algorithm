//
//  LinkedList.swift
//  Algo
//
//  Created by cxz on 2020/3/5.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
      self.val = val
        self.next = nil
    }
    
    public func logListNode() {
        var node: ListNode? = self
        var tmp = ""
        while node != nil {
            debugPrint(Unmanaged.passRetained(node!).toOpaque())
            let s = "\(node!.val) ->"
            tmp = "\(tmp)\(s)"
            node = node!.next
        }
        debugPrint(tmp)
    }
    
    public static func generateTestData(_ array: [Int]) -> ListNode? {
        if array.count == 0 {
            return nil
        }
        let head: ListNode? = ListNode(array[0])
        var ptr = head
        for i in 1..<array.count {
            let node = ListNode(array[i])
            ptr?.next = node
            ptr = node
        }
        return head
    }
    
}



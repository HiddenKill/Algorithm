//
//  Topic1.swift
//  Algo
//
//  Created by cxz on 2020/3/5.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation


/*


给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

示例：

给定一个链表: 1->2->3->4->5, 和 n = 2.

当删除了倒数第二个节点后，链表变为 1->2->3->5.

*/


class Solution {
    class func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil, head?.next != nil else {
            return nil
        }
        
        var dummy = ListNode(0)
        dummy.next = head
                
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy

        for _ in 0..<n {
            fast = fast?.next
        }
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        slow?.next = slow?.next?.next
        
        return dummy.next
    }
    
    class public func generateTestData() -> ListNode {
        let n0 = ListNode(0)
        let n1 = ListNode(1)
        let n2 = ListNode(2)
        let n3 = ListNode(3)
        let n4 = ListNode(4)
        let n5 = ListNode(5)
        let n6 = ListNode(6)

        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        n4.next = n5
        n5.next = n6
        return n0
    }
    
}

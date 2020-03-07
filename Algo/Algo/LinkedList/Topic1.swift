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

/*
 解题思路:
        双指针提前将fast右移2次
        slow和fast同时右移，此时当fast.next == nil时slow.next = slow.next.next即可
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
    
}

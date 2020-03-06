//
//  Topic3.swift
//  Algo
//
//  Created by cxz on 2020/3/6.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation

/*
 

 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。


 示例:

 给定 1->2->3->4, 你应该返回 2->1->4->3.
 */


public class Solution3 {
    
    public static func swapPairs(_ head: ListNode?) -> ListNode? {
        var dummy = ListNode(-1)
        dummy.next = head
        var cur: ListNode? = dummy
        var slow: ListNode? = dummy.next, fast: ListNode? = dummy.next?.next
        
        while slow != nil && fast != nil {
            // 注意这时候的next是在动态变化的即可  画图好解
            // 打破循环提前将slow指向fast.next即可
            cur?.next = fast
            slow?.next = fast?.next
            fast?.next = slow
            slow = slow?.next
            fast = slow?.next
            cur = cur?.next?.next
        }
        
        if slow != nil {
            cur?.next = slow
        }
        
        return dummy.next
    }
    
}

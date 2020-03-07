//
//  Topic6.swift
//  Algo
//
//  Created by cxz on 2020/3/7.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation

/*
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

 示例 1:

 输入: 1->1->2
 输出: 1->2
 示例 2:

 输入: 1->1->2->3->3
 输出: 1->2->3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution6 {
    
    public static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        let dummy: ListNode? = ListNode(head!.val+1)
        dummy?.next = head
        
        var pre: ListNode? = dummy, cur: ListNode? = dummy?.next
        while cur != nil {
            if (pre?.val != cur?.val) {
                pre?.next = cur
                pre = cur
            }
            if cur?.next == nil {
                pre?.next = nil
            }
            cur = cur?.next
        }
        return dummy?.next
    }
    
}

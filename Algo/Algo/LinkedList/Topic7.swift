//
//  Topic7.swift
//  Algo
//
//  Created by cxz on 2020/3/7.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation


/*
 
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

 你应当保留两个分区中每个节点的初始相对位置。

 示例:

 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 初次解法思路： 遍历两次，一次拿到小于x的链表，一次拿到大于等于x的链表，然后拼接起来
 */

class Solution7 {
    public static func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        let dummy1 = ListNode(0)
        dummy1.next = head
        
        let dummy2 = ListNode(0)
        dummy2.next = head
        
        
        var ptr: ListNode? = head
        var ptr1: ListNode? = dummy1
        var ptr2: ListNode? = dummy2
        
        while ptr != nil {
            if ptr!.val < x {
                ptr1?.next = ptr
                ptr1 = ptr1?.next
            } else {
                ptr2?.next = ptr
                ptr2 = ptr2?.next
            }
            ptr = ptr?.next
        }
        ptr2?.next = nil
        ptr1?.next = dummy2.next
        return dummy1.next
    }
}

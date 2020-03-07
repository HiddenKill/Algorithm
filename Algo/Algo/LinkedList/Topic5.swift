//
//  Topic5.swift
//  Algo
//
//  Created by cxz on 2020/3/6.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation


/*
 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。

 示例 1:

 输入: 1->2->3->3->4->4->5
 输出: 1->2->5
 示例 2:

 输入: 1->1->1->2->3
 输出: 2->3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 解题思路
    curVal 用于保存前一个指针的val
    cur 用于指针偏移
    当cur.val != curVal 时curVal置为-，dummy.tail指向cur
 */


public class Solution5 {
    public static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // 如果链表是空的或者只有一个节点，直接返回head即可
        if head == nil || head?.next == nil {
            return head
        }
        // 初始化虚拟头结点
        var dummy: ListNode? = ListNode(-100000)
        // 虚拟头结点指针
        var ptr: ListNode? = dummy
        
        var slow: ListNode? = dummy, fast: ListNode? = dummy?.next
        
        // 偏移指针为空时遍历链表结束
        while fast != nil {
            let isNil = fast?.next == nil
            if fast!.val != slow!.val && ((!isNil && fast!.val != fast!.next!.val) || isNil) {
                ptr?.next = fast
                ptr = ptr?.next
                debugPrint("!=")
            }
            
            if fast?.next == nil && slow?.val == fast?.val {
                debugPrint("!=")

                ptr?.next = nil
            }
            slow = slow?.next
            fast = fast?.next
        }
        return dummy?.next
    }
}

//
//  Topic2.swift
//  Algo
//
//  Created by cxz on 2020/3/6.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation


/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class Solution2 {
        public static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            
            var dummy = ListNode(0)
            var ptr1 = l1, ptr2 = l2, ptr = dummy
            
            while ptr1 != nil && ptr2 != nil {
                    if ptr1!.val >= ptr2!.val {
                        ptr.next = ptr2
                        ptr2 = ptr2!.next
                    } else {
                        ptr.next = ptr1
                        ptr1 = ptr1!.next
                    }
                ptr = ptr.next!
            }
            ptr.next = ptr1 != nil ? ptr1 : ptr2
            return dummy.next
        }
}

//
//  Topic4.swift
//  Algo
//
//  Created by cxz on 2020/3/6.
//  Copyright © 2020 cxz. All rights reserved.
//

import Foundation

/*
 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。

 示例 1:

 输入: 1->2->3->4->5->NULL, k = 2
 输出: 4->5->1->2->3->NULL
 解释:
 向右旋转 1 步: 5->1->2->3->4->NULL
 向右旋转 2 步: 4->5->1->2->3->NULL
 示例 2:

 输入: 0->1->2->NULL, k = 4
 输出: 2->0->1->NULL
 解释:
 向右旋转 1 步: 2->0->1->NULL
 向右旋转 2 步: 1->2->0->NULL
 向右旋转 3 步: 0->1->2->NULL
 向右旋转 4 步: 2->0->1->NULL

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/*
 解题思路：
 1. 将链表的尾结点指向头结点形成闭环
 2. 在形成闭环的过程中同时遍历了一遍，拿到了链表的长度length
 3. 根据链表长度和右旋转次数在遍历一次将第count-1-k个节点的next致为nil打破闭环即可
 */

public class Solution4 {
    public static func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k < 0 {
            return nil
        }
        
        var nail: ListNode? = head
        var count: Int = 1
        while nail?.next != nil {
            nail = nail?.next
            count += 1
        }
        debugPrint(count)
        var kk = k
        if k >= count {
            kk = (k%count)
        }
        debugPrint(kk)
        nail?.next = head
        
        var cur = head
        var newHead = head
        for _ in 0..<count-1-kk {
            cur = cur?.next
        }
        newHead = cur?.next
        cur?.next = nil
        return newHead
    }
}

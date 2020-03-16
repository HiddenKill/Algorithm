//
//  UsualSort.swift
//  Algo
//
//  Created by cxz on 2020/3/9.
//  Copyright © 2020 cxz. All rights reserved.
//

import UIKit

public class UsualSort {
    
    // 冒泡排序 平均情况O(n²) 最好情况 O(n) 最差情况 O(n²)
    // 空间复杂度 O(1)
    // 稳定性： 稳定
    static func bubbleSort(_ array: [Int]) -> [Int] {
        var tmp = array
        
        for i in 0..<tmp.count-1 {
            for j in 0..<tmp.count-1-i {
                if tmp[j] > tmp[j+1] {
                    (tmp[j], tmp[j+1]) = (tmp[j+1], tmp[j])
                }
            }
        }
        return tmp
    }
    
    // 鸡尾酒排序 冒泡排序的修订版 时间复杂度上比冒泡排序稍好
    // 空间复杂度 O(1)
    // 平均情况O(n²) 最好情况 O(n) 最差情况 O(n²)
    // 稳定性： 稳定
    static func wineSort(_ array: [Int]) -> [Int] {
        var left = 0, right = array.count-1
        var tmp = array
        while left < right {
            for i in left..<right {
                if tmp[i] > tmp[i+1] {
                    debugPrint(tmp[i], tmp[i+1])
                    (tmp[i], tmp[i+1]) = (tmp[i+1], tmp[i])
                    debugPrint(tmp[i], tmp[i+1])
                }
            }
            right -= 1
            for i in stride(from: right, through: left+1, by: -1) {
                if tmp[i-1] > tmp[i] {
                    (tmp[i], tmp[i-1]) = (tmp[i-1], tmp[i])
                }
            }
            left += 1
        }
        return tmp
    }
    
    // 选择排序 时间复杂度 平均情况O(n²) 最好情况 O(n) 最差情况O(n²)
    // 空间复杂度 O(1)
    // 稳定性： 不稳定
    static func choiceSort(_ array: [Int]) -> [Int] {
        var tmp = array
        
        for i in 0..<array.count {
            var min = i
            for j in i+1..<array.count {
                if tmp[j] < tmp[min] {
                    min = j
                }
            }
            if i != min {
                (tmp[i], tmp[min]) = (tmp[min], tmp[i])
            }
            debugPrint(tmp[i], tmp[min])
        }
        return tmp
    }
    
    
    // 插入排序 平均时间复杂度O(n²) 最好情况 O(n) 最差情况O(n²)
    // 空间复杂度 O(1)
    // 稳定性：稳定
    // 一般选择在数据量情况少的时候使用 (<= 1000)
    static func inserSort(_ array: [Int]) -> [Int] {
         var tmp = array
        
        for i in 1..<tmp.count {
            let cur = tmp[i]
            var j = i-1
            while j >= 0 && tmp[j] > cur {
                tmp[j+1] = tmp[j]
                j -= 1
            }
            tmp[j+1] = cur
        }
        return tmp
    }
    
    // 二分插入排序
    // 由于被插入部分一定是有序的，所以可以采用二分法查找法减少检索次数
    static func dichotomyInsertSort(_ array: [Int]) -> [Int] {
        var tmp: [Int] = array
        // 从1开始是因为第0个是可以看做是已经排序好的数组
        for i in 1..<tmp.count {
            // left 是二分查找的起始index, right是二分查找的最后一条记录的Index
            var left: Int = 0, right = i-1, target = tmp[i]
            while left <= right {
                // 中间值
                let mid: Int = (left+right)/2
                if tmp[mid] > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            // 后移操作
            for j in stride(from: i-1, through: left, by: -1) {
                tmp[j+1] = tmp[j]
            }
            tmp[left] = target
        }
        return tmp
    }
    
    // 二分查找法 -> 适用于有序数组 target: 目标值 return: 目标值的index
    static func dichotomySearch(_ array: [Int], target: Int) -> Int {
        var left = 0, right = array.count-1
        while left <= right {
            let mid: Int = (left + right) / 2
                 if array[mid] > target {
                     right = mid-1
                 } else if array[mid] < target {
                     left = mid+1
                 } else {
                    return mid
             }
        }
        return -1
    }
    
    // 希尔排序  (递减增量排序) 稳定性: 不稳定
    // 时间复杂度 最优： O(n)  最差：O(n(logn)²)  平均时间复杂度： 由步长确定
    // 空间复杂度 ： O(1)
    
    //  希尔排序是基于插入排序的以下两点性质而提出改进方法的：
    // （1）插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到线性排序的效率
    // （2）但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位
    static func shellSort(_ array: inout [Int]) {
        var gap = array.count / 2
        while gap >= 1  {
            for i in 0..<gap {
                for j in stride(from: i+gap, to: array.count, by: gap) {
                    let cur = array[j]
                    var k = j-gap
                    while k >= 0 && array[k] > cur {
                        array[k+gap] = array[k]
                        k -= gap
                    }
                    array[k+gap] = cur
                }
            }
            gap = gap / 2
        }
    }
    
    // 归并排序 -> (分为递归实现和非递归实现) 稳定性: 稳定
    // 时间复杂度 最优： O(nlogn)  最差：O(nlogn)  平均时间复杂度： O(nlogn)
    // 空间复杂度 ： O(n)
    static func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        let mid = array.count / 2
        let left = mergeSort(Array(array[0..<mid]))
        let right = mergeSort(Array(array[mid..<array.count]))
        
        return self.merge(left, right)
    }
    
    static private func merge(_ leftArr: [Int], _ rightArr: [Int]) -> [Int] {
        var tmp = [Int]()
        
        var leftIndex = 0, rightIndex = 0
        
        while leftIndex < leftArr.count && rightIndex < rightArr.count {
            var cur = 0
            if leftArr[leftIndex] <= rightArr[rightIndex] {
                cur = leftArr[leftIndex]
                leftIndex+=1
            } else {
                cur = rightArr[rightIndex]
                rightIndex+=1
            }
            tmp.append(cur)
        }
        
        while leftIndex < leftArr.count {
            tmp.append(leftArr[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightArr.count {
            tmp.append(rightArr[rightIndex])
            rightIndex += 1
        }
        
        return tmp
    }
    
    // 堆排序 平均情况O(nlogn) 最好情况 O(nlogn) 最差情况 O(nlogn)
    // 空间复杂度 O(1)
    // 稳定性： 不稳定
    // 1. 将无序数组创建成最大堆 (将所有非叶子节点自下向上，自右而左的递归遍历，将父节点和左右子节点的最大值放到父节点即可
    // 2. 交换堆顶元素和数组最后一个元素
    // 3. 重新构建最大堆 (此时是自顶向下递归构建，因为这时候A(1)或A(2)必定是最大元素之一，只需要将A(0)向下遍历知道变成最大堆即可
    static func heapSort(_ array: inout [Int]) {
        // 自最后一个非叶子节点开始倒序遍历，直至构建成最大堆
        for i in (0...array.count/2-1).reversed() {
            self.buildMaxHeap(&array, i: i, count: array.count)
        }
        // 将Array(0)与最后一个节点交换，得到最大值，同时去掉最后一个已经排序好的最大值，将剩余节点继续构建最大堆
        // 自上而下重新构建最大堆，因为此时除了堆顶节点，其余节点满足最大堆的定义
        for i in (1...array.count-1).reversed() {
            // 交换最大值与最后一个节点
            (array[0], array[i]) = (array[i], array[0])
            // 除去最后一个node然后继续构建最大堆
            self.buildMaxHeap(&array, i: 0, count: i)
        }
    }
    
    // 构建最大堆
    // array: 原数组
    // i: 当前遍历节点
    // size: 需要遍历的数组的大小 (在交换A(0)和A(size-1)后 需要遍历的数组大小size--
    static func buildMaxHeap(_ array: inout [Int], i: Int, count: Int) {
        var max = i
        let left = 2*i+1
        let right = 2*i+2
        if left < count && array[left] > array[max] {
            max = left
        }
        if right < count && array[right] > array[max] {
            max = right
        }
        if max != i {
            (array[i], array[max]) = (array[max], array[i])
            buildMaxHeap(&array, i: max, count: count)
        }
    }
    
    
    // 快速排序 quickSort
    public static func quickSort(_ array: inout [Int]) {
        if array.count <= 1 {
            return
        }
        self.quick(&array, left: 0, right: array.count-1)
    }
    
    static func quick(_ array: inout [Int], left: Int, right: Int) {
        if left >= right {
            return
        }
        // 基准值
        let pivot = array[right]
        var i = left, j = right
        while i != j {
            while array[i] <= pivot && i < j {
                i+=1
            }
            while array[j] >= pivot && i < j {
                j-=1
            }
            if i < j {
                (array[i], array[j]) = (array[j], array[i])
            }
        }
        array[right] = array[i]
        array[i] = pivot
        
        self.quick(&array, left: left, right: i-1)
        self.quick(&array, left: i+1, right: right)
    }
}

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
            for j in stride(from: i-1, through: 0, by: -1) {
                if tmp[j] > cur {
                    tmp[j+1] = tmp[j]
                }
                if tmp[j] < cur {
                    tmp[j+1] = cur
                    break
                }
            }
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
    static func shellSort(_ array: [Int]) -> [Int] {
        var tmp = array
       
        return tmp
    }
    
    
    
    
    
    
}

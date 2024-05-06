class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hashmap = {}                   # hashmap initialized and dict use to store
        for i in range(len(nums)):      # method iterates through each index i in the range of the length of the nums list. 
            diff = (target - nums[i])   # Calculate  between difference target and current element
            if diff in hashmap:
                return[i, hashmap.get(diff)]
            hashmap[nums[i]] = i
        

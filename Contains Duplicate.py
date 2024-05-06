class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        hashset = set()                # Set named 'hashed' initialized to store unique elements                                        
        for num in nums:               # Method iterates through each element num in the list nums. If num is already present in the hashset,                                         
            if num in hashset:
                return True            #it means it's a duplicate, so the method immediately returns True.
            hashset.add(num)           #If num is not already in hashset, it adds num to the set using the add method.
        return False                   # If the loop completes without finding any duplicates then return false

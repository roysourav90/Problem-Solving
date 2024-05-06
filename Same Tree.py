# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        if not p and not q:                                          #  checks if both p and q are None, then return True
            return True
        if not p or not q or p.val != q.val:                        # p or q is None (but not both) or p.val and q.val are different, it means the trees are not the same, then return false
            return False
        return self.isSameTree(p.left, q.left) and self.isSameTree(p.right, q.right)    # current nodes in both trees (p and q) are the same. So, it recursively calls isSameTree
        

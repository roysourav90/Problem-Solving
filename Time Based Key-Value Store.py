class TimeMap:

    def __init__(self):
        self.map = collections.defaultdict(list)
        

    def set(self, key: str, value: str, timestamp: int) -> None:
        self.map[key].append((timestamp, value))
        

    def get(self, key: str, timestamp: int) -> str:
        if key not in self.map:
            return ""
        values = self.map[key]
        left, right = 0, len(values) - 1
        while left <= right:
            mid = left + (right-left) // 2
            if values[mid][0] == timestamp:
                return values[mid][1]
            elif values[mid][0] < timestamp:
                left = mid + 1
            else:
                right = mid - 1
        return values[right][1] if right >= 0 else ""
    
# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap()
# obj.set(key,value,timestamp)
# param_2 = obj.get(key,timestamp)

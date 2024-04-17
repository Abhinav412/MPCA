class Cache:
    def __init__(self, capacity, block_size, associativity, write_policy):
        self.capacity = capacity
        self.block_size = block_size
        self.associativity = associativity
        self.num_sets = capacity // (block_size * associativity)
        self.write_policy = write_policy
        self.cache = [[(0, 0, None) for _ in range(associativity)] for _ in range(self.num_sets)]

    def get_tag_and_index(self, address):
        tag_bits = address >> (self.block_size.bit_length() + self.num_sets.bit_length())
        index_bits = (address >> self.block_size.bit_length()) & (self.num_sets - 1)
        return tag_bits, index_bits

    def access(self, address, write=False):
        tag, index = self.get_tag_and_index(address)
        cache_set = self.cache[index]

        for i, (valid, tag_bits, data) in enumerate(cache_set):
            if valid and tag_bits == tag:
                if write and self.write_policy == "write-back":
                    cache_set[i] = (valid, tag_bits, data)
                elif write and self.write_policy == "write-through":
                    print("Write-Through: Writing data to main memory.")
                    cache_set[i] = (valid, tag_bits, data)
                return "Hit", data

        for i, (valid, _, _) in enumerate(cache_set):
            if not valid:
                cache_set[i] = (1, tag, None)
                return "Miss", None

        if self.write_policy == "write-back":
            print("Write-Back: Evicting data from cache.")
        elif self.write_policy == "write-through":
            print("Write-Through: Writing data to main memory.")

        cache_set[0] = (1, tag, None)
        return "Miss (Eviction)", None

    def print_cache_state(self):
        for i, cache_set in enumerate(self.cache):
            print("Set", i, ":", end=" ")
            for j, (valid, tag, data) in enumerate(cache_set):
                if valid:
                    print("[Valid: {} Tag: {} Data: {}]".format(valid, tag, data), end=" ")
                else:
                    print("[Empty]", end=" ")
            print()


def main():
    capacity = int(input("Enter cache capacity: "))
    block_size = int(input("Enter block size: "))
    associativity = int(input("Enter associativity: "))
    write_policy = input("Enter write policy (write-back / write-through): ")

    cache = Cache(capacity, block_size, associativity, write_policy)

    hits = 0
    misses = 0
    evictions = 0

    while True:
        addr = input("Enter memory address in hexadecimal (or 'q' to quit): ")
        if addr.lower() == 'q':
            break

        try:
            address = int(addr, 16)
        except ValueError:
            print("Invalid input. Please enter a hexadecimal number.")
            continue

        write_input = input("Is it a write operation? (y/n): ")
        write = True if write_input.lower() == 'y' else False

        access_type, data = cache.access(address, write)
        if access_type == "Hit":
            hits += 1
        elif access_type == "Miss":
            misses += 1
        else:
            misses += 1
            evictions += 1

        print("Access Type:", access_type)
        if data is not None:
            print("Data Retrieved:", data)
        cache.print_cache_state()
        print()

    print("Hits:", hits)
    print("Misses:", misses)
    print("Evictions:", evictions)

if __name__ == "__main__":
    main()
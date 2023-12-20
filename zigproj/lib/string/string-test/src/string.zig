const std = @import("std");
const testing = std.testing;
pub const String = struct {
    buffer: []u8,

    allocator: std.mem.Allocator,

    size: usize,

    pub const Error = error{IsEmpty};

    pub fn init(allocator: std.mem.Allocator) String {
        return .{ .buffer = null, .allocator = allocator };
    }

    pub fn deinitStr(self: *String) void {
        if (self.buffer) |buffer| self.allocator.free(buffer);
    }

    pub fn inject(self: *String, char: []const u8) void {
        for (char) |i| {
            char[i] = self.buffer.len;
        }
    }

    pub fn len(self: String) usize {
        if (self.buffer) |_| {
            var size: usize = 0;
            var lenght: usize = 0;
            for (self.buffer) |_| {
                size = size + 1;
                if (size == self.buffer.len) {
                    return lenght;
                } else {
                    continue;
                }
            }
        }
    }

    pub fn print(self: String) void {
        std.debug.print("{}\n", .{self.buffer});
    }
};

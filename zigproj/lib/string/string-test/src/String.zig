const std = @import("std");

pub const String = struct {
    const Self = @This();
    pub const Error = error{LengthMismatch};

    buffer: std.ArrayList(u8),

    size: usize,

    pub fn init(allocator: std.mem.Allocator) String {
        return .{ .buffer = std.ArrayList(u8).init(allocator), .size = 0 };
    }

    pub fn deinit(self: *Self) void {
        self.buffer.deinit();
        //if (self.buffer) |buffer| self.allocator.free(buffer);
    }

    pub fn injectStr(self: *Self, chars: []const u8) !void {
        const len = self.buffer.items.len;

        if (len < 1) {
            for (chars) |c|
                try self.buffer.append(c);
            return;
        }

        if (len != chars.len) return Self.Error.LengthMismatch;

        for (0..chars.len) |i| {
            self.buffer.items[i] = chars[i];
        }
    }

    pub fn getStr(self: *Self) []u8 {
        return self.buffer.items;
    }
};

test {
    var string = String.init(std.testing.allocator);
    defer string.deinit();
    try string.injectStr("Hello, World!");
    try std.testing.expectEqualStrings(string.getStr(), "Hello, World!");
}

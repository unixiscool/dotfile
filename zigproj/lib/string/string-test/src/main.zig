const std = @import("std");
pub const String = struct {
    buffer: ?[]u8,

    allocator: std.mem.Allocator,

    size: usize,

    pub const Error = error{IsEmpty};

    pub fn init(allocator: std.mem.Allocator) String {
        return .{ .buffer = null, .allocator = allocator, .size = 0 };
    }

    pub fn deinitStr(self: *String) void {
        if (self.buffer) |buffer| self.allocator.free(buffer);
    }

    pub fn inject(self: *String, char: []const u8) !void {
        if (self.buffer) |buffer| {
            for (buffer, 0..) |_, i| {
                buffer[i] = char[i];
            }
            std.debug.print("{any}\n", .{buffer});
        }
    }

    pub fn print(self: String) void {
        std.debug.print("{any}\n", .{self.buffer});
    }
};

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    var str = String.init(allocator);
    defer str.deinitStr();
    try str.inject("xui");
    std.debug.print("{any}\n", .{str.buffer});
}

const std = @import("std");

pub fn main() !void {
    const array = [_]u8{ 1, 2, 3, 4, 5 };
    for (array, 0..) |item, index| {
        std.log.info("Item[{}] = {}", .{ index, item });
    }
}

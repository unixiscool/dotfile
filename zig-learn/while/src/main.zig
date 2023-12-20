const std = @import("std");

pub fn main() !void {
    var number: i32 = 0;

    while (number < 10) : (number += 1) {
        std.log.info("{}", .{number});
    }
}

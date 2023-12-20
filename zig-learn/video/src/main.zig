const std = @import("std");
const vkatun = struct {
    name: []const u8,
    age: i8,
    pub fn birthday(self: @This()) void {
        self.age += 1;
        std.log.info("{}", .{self.age});
    }
};
pub fn main() !void {
    var x: i128 = 0;
    mul(x);
}

pub fn mul(n: i128) void {
    var res: i128 = n + 2;
    std.log.info("{}", .{res});
}

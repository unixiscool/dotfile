const std = @import("std");

pub fn main() !void {
    //const value: ?u32 = null;
    //_ = value;
    //const errf = null orelse error.too; //it's error
    //std.debug.print("{}\n", .{errf});

    const typ = null orelse error.Define;
    std.debug.print("{}\n", .{typ});
}

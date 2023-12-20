const std = @import("std");
const err = enum { oldnotswitched };
pub fn main() !void {
    var age: u32 = 1;
    switch (age) {
        0...4 => {
            std.log.info("You are less than 4 years old?", .{});
        },
        5...16 => {
            std.log.info("You,re young", .{});
        },
        17...20 => {
            std.log.info("My man!!!!! or Woman", .{});
        },
        getage() => {
            std.log.info("Hmmm... looks cool", .{});
        },
        else => {
            const errorhandle = err.oldnotswitched;
            defer std.debug.print("{}\n", .{errorhandle});
        },
    }
}

pub fn getage() u32 {
    return 21;
}

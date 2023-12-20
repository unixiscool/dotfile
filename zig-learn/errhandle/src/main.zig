const std = @import("std");
const shell = enum(u8) {
    cd,
    ls,
    pwd,
};
const c = @cImport({
    @cInclude("stdio.h");
});
pub fn main() !void {
    //if (true)
    //return error.YouAreDied;

    var value: ?u32 = null;
    std.debug.print("{}\n", .{value == null});
    var x: i32 = 10;
    var ptr: ?*i32 = &x;

    //if (ptr.?.* == 10) {
    //    std.log.info("{any}\n", .{ptr.?.*});
    //}

    switch (ptr.?.*) {
        10 => {
            std.log.info("{any}\n", .{ptr.?.*});
            _ = c.printf("printf from c\n");
            var buffer: [20]u8 = undefined;
            //var input: ?c_int = c.scanf("%s", &buffer);
            _ = c.scanf("%s", &buffer);
            std.debug.print("{s}\n", .{buffer});
            //const uu: ?[]u8 = &c.printf("%s", &input);
            for (0..buffer.len) |i| {
                if (i == '�') {
                    return error.Invalid;
                } //else {
                // std.debug.print("{s}\n", .{buffer});
                // continue;
                //}
            }

            std.debug.print("size: {}", .{@TypeOf("�")});
            //std.debug.print("{s}\n", .{buffer});
            //for (buffer) |elem| {
            //    std.debug.print("{any}", .{elem});
            //}
        },
        else => {
            std.log.info("err", .{});
        },
    }
}

test "basic math" {
    const x = 1;
    const y = 3;
    if (x + y == 3) {
        unreachable;
    }
}

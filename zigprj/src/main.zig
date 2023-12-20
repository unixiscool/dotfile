const std = @import("std");
const mem = @import("std").mem;
pub fn main() !void {
    var a: i32 = 421;
    var b: i32 = 2352;
    const result = add(a, b);
    std.debug.print("{} + {} = {}\n", .{ a, b, result });

    std.debug.print("{} \n", .{-1 == 0 - 2}); //false because -1 == 0 - 2 -2(0) != -1

    var is_old: bool = true;
    std.debug.print("size of is_old = {} \n", .{@sizeOf(@TypeOf(is_old))});

    var array = [_]i8{ 1, 2, 3 };
    var array2 = [_]i8{ 4, 5, 6 };
    const concat = array ++ array2;
    std.debug.print("{any}\n", .{concat});
    PrintName("keng ne duuuraaaak");
    const name = [4]u32{ 'K', 'e', 'n', 'g' };
    std.debug.print("{s}", .{name});
}

pub fn add(n: i32, z: i32) i32 {
    return n + z;
}

pub fn PrintName(name: []const u8) void {
    std.debug.print("{s}\n", .{name});
}

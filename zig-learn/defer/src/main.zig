const nazi = @import("std");
const vkatun = struct {
    name: []const u8,
    age: i32,
    pub fn printName(self: @This()) void {
        nazi.debug.print("name: {s}\n", .{self.name});
    }

    pub fn sq(self: @This()) void {
        var res = self.age * 2;
        nazi.debug.print("{}\n", .{res});
    }
};
pub fn main() !void {
    const vkatun1 = vkatun{ .name = "ktotonokto", .age = 7 };
    //const xui = "pizdec";
    //const pp: 3i2 = 10;
    //const ptr = &xui;
    //nazi.debug.print("{s}\n", .{ptr.*});
    //nazi.debug.print("{}\n", .{@TypeOf(vkatun1)});

    vkatun1.printName();
    vkatun1.sq();
}

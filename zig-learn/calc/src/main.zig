const std = @import("std");
const assert = @import("std").debug.assert;
const calc = struct {
    first: i128,
    two: i128,

    pub fn add2(self: calc) void {
        var result: i128 = self.first + self.two;
        std.log.info("{} + {} = {}\n", .{ self.first, self.two, result });
    }
    pub fn sub2(self: @This()) void {
        var result: i128 = self.first - self.two;
        std.log.info("{} - {} = {}\n", .{ self.first, self.two, result });
    }
    pub fn div2(self: @This()) void {
        var result: i128 = self.first / self.two;
        std.log.info("{} / {} = {}\n", .{ self.first, self.two, result });
    }
    pub fn mul2(self: @This()) void {
        var result: i128 = self.first * self.two;
        std.log.info("{} * {} = {}\n", .{ self.first, self.two, result });
    }
};
pub fn main() !void {
    var a: i128 = 128;
    var b: i128 = 4;
    var calculator = calc{ .first = a, .two = b };
    //@compileLog(calculator.first);
    //@compileLog(calculator.two);
    //@as(void, @compileLog(calculator.res));
    //@as(void, @compileLog(calculator.two));
    //@as(void, @compileLog(calculator.first));
    mul1(&calculator);
}

pub fn add1(t: anytype) void {
    t.add2();
}

pub fn sub1(t: anytype) void {
    t.sub2();
}

pub fn div1(t: anytype) void {
    t.div2();
}

pub fn mul1(t: anytype) void {
    t.mul2();
}

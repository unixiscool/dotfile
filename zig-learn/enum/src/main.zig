const std = @import("std");
const month = enum(u32) {
    January,
    February,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    October,
    November,
    December,

    pub fn isNovember(self: @This()) bool {
        return self == .November;
    }
};
const MyStruct = struct {
    first: i32,
    second: i32,
    result: i32,
};

pub fn main() !void {
    const Month: month = .November;
    std.log.info("Month is: {}, Size of month: {}", .{ @intFromEnum(Month), @sizeOf(month) });
    std.log.info("Month is November: {}\n", .{Month.isNovember()});
    //const res = make_struct();
    //_ = res;
    //std.log.info("{}", .{});
    var myInstance = MyStruct{
        .first = 5,
        .second = 3,
        .result = 0,
    };

    add(&myInstance);
    var ff: i128 = 1;
    ff = aa(ff);
    ff = aa(ff);
    std.log.info("{}", .{ff});
}

pub fn make_struct() @TypeOf(struct {}) {
    const struct1 = struct {
        text: []const u8,
    };
    return struct1;
}

pub fn add(self: *MyStruct) void {
    // Вычисляем result как сумму полей first и second
    self.result = self.first + self.second;
    std.debug.print("Result: {}\n", .{self.result});
}

pub fn aa(n: i128) i128 {
    var res: i128 = n + 1;
    return res;
}

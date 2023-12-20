const std = @import("std");
const UserInfo = struct {
    name: []const u8,
    age: u32,

    pub fn init(name: []const u8, age: u32) UserInfo {
        return UserInfo{
            .name = name,
            .age = age,
        };
    }

    pub fn printName(self: UserInfo) void {
        std.log.info("{s}\n", .{self.name});
    }
};
pub fn main() !void {
    //const user = UserInfo{
    //    .name = "Aleksandr",
    //    .age = 15,
    //};

    //std.debug.print("{s}\n", .{user.name});

    const user2 = UserInfo.init("Aleksandr", 15);
    std.log.info("{s}\n", .{user2.name});
    user2.printName();
}

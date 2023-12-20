const std = @import("std");
pub const user = struct {
    id: u64,
    name: []const u8,

    pub fn init(allocator: std.mem.Allocator, id: u64, name: []const u8) !*user {
        var User = try allocator.create(user);
        User.* = .{
            .id = id,
            .name = name,
        };
        return User;
    }

    pub fn printName(self: @This()) void {
        std.debug.log("{s}", .{self.name});
    }
};
pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const ptr = try allocator.create(i32);
    _ = ptr;
    const allocator2 = arena.allocator();
    var ptr2 = try allocator2.create(i32);
    std.log.info("{}", .{@TypeOf(ptr2)});
    var user1 = user.init(std.heap.page_allocator, 17, "fugy");
    std.log.info("{any}", .{@TypeOf(user1)});
}

const std = @import("std");
const MultiArrayList = std.MultiArrayList; //global multiarraylist
const Song = struct {
    title: []const u8,
    track_no: u32,
};
pub fn main() !void {
    var alloc = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer alloc.deinit();

    var allocator = alloc.allocator();

    var list = MultiArrayList(Song){};
    try list.append(allocator, .{ .title = "Not Afraid", .track_no = 4 });
    try list.append(allocator, .{ .title = "Keng", .track_no = 5 });
    try list.append(allocator, .{ .title = "Fuga", .track_no = 6 });
    for (list.items(.title)) |title| {
        std.log.info("Title: {s}", .{title});
    }
}

const std = @import("std");
const command = enum(u8) { cat };
pub fn main() !void {
    std.debug.print("Пожалуйста введите путь к файлу: \n", .{});
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const stdin = std.io.getStdIn().reader();
    _ = stdin;
    var list = std.ArrayList(u21).init(std.heap.page_allocator);
    //var fbs = std.io.fixedBufferStream(list);
    //try stdin.streamUntilDelimiter(fbs.writer(), '\n', list.len);
    //var allocator = arena.allocator();
    //const file = try std.fs.cwd().readFileAlloc(allocator, , 100);
    //std.debug.print("{s}", .{file});
    for (list) |item| {
        std.log.info("{}", .{item});
        if (list == 170) {
            break;
        }
    }

    var allocator = arena.allocator();
    const file = try std.fs.cwd().readFileAlloc(allocator, list, 100);
    std.debug.print("{s}", .{file});
}

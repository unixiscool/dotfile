const std = @import("std");
const capy = @import("capy");
pub fn main() !void {
    try capy.backend.init();
    var coin: i32 = 0;
    _ = coin;
    //const buttn = capy.button(.{
    //    .label = "Save",
    //});
    var window = try capy.Window.init();
    try window.set(capy.column(.{ .spacing = 10 }, .{ // have 10px spacing between each column's element
        capy.row(.{ .spacing = 5 }, .{ // have 5px spacing between each row's element
        capy.button(.{ .label = "Save", .onclick = @ptrCast(&buttonClicked) })}),
        // Expanded means the widget will take all the space it can
        // in the parent container
        capy.expanded(capy.textArea(.{ .text = "Hello World!" })),
    }));
    window.setPreferredSize(800, 600);
    window.show();
    capy.runEventLoop();
}

fn buttonClicked(button: *capy.Button) !void {
    std.log.info("You clicked button with text {s}", .{button.getLabel()});
}

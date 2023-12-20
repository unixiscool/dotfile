const std = @import("std");
pub fn main() !void {
    if (1)
        @compileError("error");
}

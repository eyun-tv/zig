const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub fn main() anyerror!void {
    try stdout.print("Hello, {s}!\n", .{"world"});
}

test "basic test" {
    try std.testing.expectEqual(10, 3 + 7);
}

const std = @import("std");
const stdout = std.io.getStdOut().writer();

const network = @import("network");
const socket = network.Socket.create("0.0.0.0", 0);

pub fn main() anyerror!void {
    try network.init();
    defer network.deinit();

    socket.listen();

    try stdout.print("Hello, {s}!\n", .{"world"});
}

// test "basic test" {
//    try std.testing.expectEqual(10, 3 + 7);
// }

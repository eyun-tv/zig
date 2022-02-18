const std = @import("std");
const print = @import("std").debug.print;

const network = @import("network");

pub fn main() anyerror!void {
    try network.init();
    defer network.deinit();

    const sk = try network.Socket.create(.ipv4, .udp);
    defer sk.close();

    try sk.bindToPort(0);
    try sk.listen();

    print("Hello, {s}!\n", .{"world"});
}

// test "basic test" {
//    try std.testing.expectEqual(10, 3 + 7);
// }

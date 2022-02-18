const std = @import("std");
const print = @import("std").debug.print;

const network = @import("network");

pub fn main() anyerror!void {
    try network.init();
    defer network.deinit();

    var sk = try network.Socket.create(.ipv4, .tcp);
    //var sk = try network.Socket.create(.ipv4, .udp);
    defer sk.close();

    try sk.bindToPort(0);
    try sk.listen();
    print("listen on {}", .{sk.getLocalEndPoint()});
}

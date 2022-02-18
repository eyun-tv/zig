const std = @import("std");
const print = std.debug.print;
//const bitmap = @import("./bitmap.zig");

const network = @import("network");

pub fn main() anyerror!void {
    //var bm = bitmap.roaring_bitmap_create();
    //bitmap.roaring_bitmap_add(bm, 1);

    try network.init();
    defer network.deinit();

    const sk = try network.Socket.create(.ipv4, .udp);
    defer sk.close();

    try sk.bindToPort(0);
    print("listen on udp://{}\n", .{sk.getLocalEndPoint()});
}

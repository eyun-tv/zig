const std = @import("std");
const deps = @import("./deps.zig");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();
    const is_production = mode != .Debug;

    const lib = b.addStaticLibrary("rmw", "src/main.zig");
    lib.setBuildMode(mode);
    deps.addAllTo(lib);
    lib.install();

    if (is_production) {
        lib.strip = true;
    }

    const exe = b.addExecutable("rmw", "demo/main.zig");
    const target = b.standardTargetOptions(.{});
    exe.setTarget(target);
    exe.setBuildMode(mode);
    deps.addAllTo(exe);
    exe.install();

    if (is_production) {
        exe.strip = true;
    }

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}

const std = @import("std");
const flecs = @import("flecs");

const Position = struct { x: f32, y: f32 };
const Walking = struct {};

pub fn main() !void {
    var w1 = flecs.World.init();
    defer w1.deinit();

    var w2 = flecs.World.init();
    defer w2.deinit();

    const bob_w1 = w1.newEntityWithName("Bob");
    const bob_w2 = w2.newEntityWithName("Bob");
    // The set operation finds or creates a component, and sets it.
    bob_w1.set(&Position{ .x = 10, .y = 20 });
    bob_w2.set(&Position{ .x = 1002, .y = 200 });

    // The add operation adds a component without setting a value. This is
    // useful for tags, or when adding a component with its default value.
    // bob_w1.add(Walking);

    // Get the value for the Position component
    if (bob_w1.get(Position)) |position| {
        std.log.debug("position: {d}", .{position});
    }
}
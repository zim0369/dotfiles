use std::io;

fn write() {}

fn main() {
    let mut input = String::new();
    std::io.read_line(&mut input).expect("Failed to read");

    write(input);
}

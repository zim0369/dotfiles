use std::io;

fn main() {
    let mut input_text = String::new();
    io::stdin()
        .read_line(&mut input_text)
        .expect("failed to read from stdin");

    let mut input_text = input_text.trim().parse::<u32>().unwrap();
    while input_text > 0 {
        solution();
        input_text -= 1;
    }
}

fn solution() {}

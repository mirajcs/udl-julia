use serde_pickle::{DeOptions, Value};
fn show(v: &Value, depth: usize) {
    let pad = "  ".repeat(depth);
    match v {
        Value::Dict(d) => for (k, v) in d { println!("{pad}{k:?}:"); show(v, depth + 1) },
        Value::List(l) | Value::Tuple(l) => { println!("{pad}seq len {}", l.len()); for x in l.iter().take(6) { show(x, depth + 1) } },
        Value::Bytes(b) => println!("{pad}bytes {}", b.len()),
        other => println!("{pad}{}", format!("{other:?}").chars().take(80).collect::<String>()),
    }
}
fn main() {
    let f = std::fs::File::open("../mnist1d_data.pkl").unwrap();
    let v = serde_pickle::value_from_reader(f, DeOptions::new().replace_unresolved_globals()).unwrap();
    show(&v, 0);
}

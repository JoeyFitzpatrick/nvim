const help: number = 12
function something<T>() {
    console.log(1)
}

function f(a, g) { // Noncompliant: 'f' returns 'b' on two different return statements
  const b = 42;
  if (a) {
    g(a);
    return b;
  }
  return b;
}

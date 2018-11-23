function do_stuff(text) {
  const [stack, temp] = [
    [],
    []
  ];
  text.split("").forEach(v => {
    if (v === "n") {
      while (stack[stack.length - 1] === "g") {
        temp.push(stack.pop());
      }
      stack.push(v);
      while (temp.length !== 0) {
        stack.push(temp.pop())
      }
    } else {
      stack.push(v)
    }
  })
  return stack.join("");
}

texts = ["he was searchign on Bign for signign kigns",
  "rignadingdiggn!",
  "gngngnnggnngggnnn",
  "pign me when you see ggn",
  "ggggggnnnnnn"
]

texts.forEach(text => console.log(do_stuff(text)))
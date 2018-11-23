function do_stuff(text){
  const [stack, temp] = [[],[]];
  text.split("").forEach(v => {
    if(v === "n"){
      while(stack[stack.length - 1] === "g"){
        temp.push(stack.pop());
      }
      stack.push(v);
      while(temp.length !== 0){
        stack.push(temp.pop())
      }
    }else{
      stack.push(v)
    }
  })
  return stack.join("");
}


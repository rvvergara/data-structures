function tags() {
  return {
    "<": ">",
    "(": ")",
    "{": "}",
    "[": "]"
  }
}

function do_stuff(text) {
  const unpaired = [];
  text.split("").forEach(v => {
    if (Object.keys(tags()).includes(v)) unpaired.push(v)
    else if (Object.values(tags()).includes(v)) {
      tags[unpaired.pop()] === v ? undefined : unpaired.push(v)
    }
  })
  return unpaired.length === 0
}
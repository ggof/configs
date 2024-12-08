const fs = require('fs/promises')

function createCompletionSource(files) {
  return fs.writeFile("completions.lua", `return { ${files.map(it => `"${it.split(".")[0]}"`).join(", ")} }`)

}

async function main() {
  const dir = await fs.readdir(".")
  const files = dir.filter(it => it.endsWith(".yaml"))

  await createCompletionSource(files)

  for (const file of files) {
    const contentBuf = await fs.readFile(file)
    const content = contentBuf.toString().split("\n").map(it => it.trim())

    const colors = {}
    for (const line of content) {
      if (!line.startsWith("base")) continue
      const rg = /(base[\da-fA-F]{2}): "([\da-fA-F]{6})"/
      const color = line.match(rg)
      if (!color) continue

      colors[color[1]] = color[2]
    }

    const output = `return {
  ${Object.entries(colors).map(([k, v]) => `${k} = "#${v}"`).join(",\n\t")}
}`

    await fs.writeFile(file.split(".")[0] + ".lua", output)
  }
}

main()


function add_include_after(doc)
  
  for k,v in pairs(doc.meta) do
    quarto.log.output(k)
  end
  
  filename = doc.meta["include-file-after"][1].text
  file = io.open(filename, "r")
  input = file:read("*a")
  additional_content = pandoc.read(input, "markdown", PANDOC_READER_OPTIONS)
  
  for i = 1, #additional_content.blocks do
    table.insert(doc.blocks, additional_content.blocks[i])
  end
  
  return doc
end

return {
  Pandoc = add_include_after
}
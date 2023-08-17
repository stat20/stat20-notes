
function add_include_after(pandoc)
  
  for k,v in pairs(pandoc.meta) do
    quarto.log.output(k)
  end
  
  file_path = pandoc.meta["include-file-after"][1].text
          
  quarto.log.output(io.popen(file_path):lines())

  return pandoc
end

return {
  Pandoc = add_include_after
}
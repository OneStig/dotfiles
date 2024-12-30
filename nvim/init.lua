require("icpc")

-- Function to open PDF in Zathura
local function open_pdf_in_zathura()
  local pdf_path = vim.fn.expand('%:r') .. '.pdf'
  
  -- Check if Zathura is already running with this PDF
  local handle = io.popen("pgrep -f 'zathura " .. pdf_path .. "'")
  local result = handle:read("*a")
  handle:close()

  if result == "" then
    -- Zathura is not running, open it
    vim.fn.jobstart({'zathura', pdf_path}, {detach = true})
  else
    -- Zathura is already running, send reload signal
    vim.fn.system('zathura --reload')
  end
end
-- Setup latexmk to compile and show pdf in Zathura
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  pattern = {"*.tex"},
  callback = function()
    local tex_file = vim.fn.expand('%')
    local out_dir = vim.fn.expand('%:p:h') .. "/out"
    
    -- Create the out directory if it doesn't exist
    vim.fn.mkdir(out_dir, "p")

    -- Compile with latexmk and output to ./out directory
    vim.fn.jobstart({'latexmk', '-pdf', '-interaction=nonstopmode', '-synctex=1', '-outdir=' .. out_dir, tex_file})

    -- Open or refresh Zathura with the PDF from the out directory
    local pdf_path = out_dir .. '/' .. vim.fn.expand('%:t:r') .. '.pdf'
    local handle = io.popen("pgrep -f 'zathura " .. pdf_path .. "'")
    local result = handle:read("*a")
    handle:close()

    if result == "" then
      vim.fn.jobstart({'zathura', pdf_path}, {detach = true})
    else
      vim.fn.system('zathura --reload')
    end
  end,
})

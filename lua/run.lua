local function split()
    -- local winsel = vim.fn.win_getid()
    -- local winhei = vim.fn.winheight(winsel)
    -- local winwid = vim.fn.winwidth(winsel)
    -- if winhei * 2.5 > winwid then
    --     vim.o.splitbelow = true
    --     vim.cmd('split')
    --     vim.cmd('resize-5')
    -- else
    --     vim.o.splitright = true
    --     vim.cmd('vsplit')
    --     vim.cmd('vertical resize-20')
    -- end
    vim.cmd("FloatermNew")
end

local function Run()
    vim.cmd('w')
    if (vim.bo.filetype == 'c') then
        -- split()
        if (vim.fn.filereadable('Makefile') == 1) then
            vim.cmd('FloatermNew --autoclose=0 make && ./Main')
        else
            vim.cmd('FloatermNew --autoclose=0 gcc "%" -o "%<" && "./%<" && rm -f "./%<"')
        end
    elseif (vim.bo.filetype == 'cpp') then
        -- split()
        if (vim.fn.filereadable('Makefile') == 1) then
            vim.cmd('FloatermNew --autoclose=0 make && ./Main')
        else
            vim.cmd('FloatermNew --autoclose=0 g++ "%" -O2 -g -Wall -o "%<" && "./%<" && rm -f "./%<"')
        end
    elseif (vim.bo.filetype == 'python') then
        -- split()
        vim.cmd('FloatermNew --autoclose=0 python3 "%"')
    elseif (vim.bo.filetype == 'lua') then
        -- split()
        vim.cmd('FloatermNew --autoclose=0 lua "%"')
    elseif (vim.bo.filetype == 'markdown') then
        vim.cmd('MarkdownPreview')
    elseif (vim.bo.filetype == 'sh') then
        -- split()
        vim.cmd('FloatermNew --autoclose=0 bash "%"')
    elseif (vim.bo.filetype == 'html') then
        vim.cmd([[
            tabe
            term live-server --browser=chromium
            tabclose
        ]])
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
    end
end

vim.keymap.set('n', '<F5>', Run, { noremap = true })

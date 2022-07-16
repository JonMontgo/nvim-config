require('lualine').setup {
  options = {
    theme = 'nord'
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1, -- Just patch this so that I get relative paths instead name

      }
    }
  }
}

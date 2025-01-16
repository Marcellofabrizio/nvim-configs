return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    dashboard.section.header.val = {
      [[ $$$$$$\            $$\ $$\          $$\    $$\ $$$$$$\ $$\      $$\ ]],
      [[$$  __$$\           $$ |$$ |         $$ |   $$ |\_$$  _|$$$\    $$$ |]],
      [[$$ /  \__| $$$$$$\  $$ |$$ | $$$$$$\ $$ |   $$ |  $$ |  $$$$\  $$$$ |]],
      [[$$ |      $$  __$$\ $$ |$$ |$$  __$$\\$$\  $$  |  $$ |  $$\$$\$$ $$ |]],
      [[$$ |      $$$$$$$$ |$$ |$$ |$$ /  $$ |\$$\$$  /   $$ |  $$ \$$$  $$ |]],
      [[$$ |  $$\ $$   ____|$$ |$$ |$$ |  $$ | \$$$  /    $$ |  $$ |\$  /$$ |]],
      [[\$$$$$$  |\$$$$$$$\ $$ |$$ |\$$$$$$  |  \$  /   $$$$$$\ $$ | \_/ $$ |]],
      [[ \______/  \_______|\__|\__| \______/    \_/    \______|\__|     \__|]],
    }

    alpha.setup(dashboard.opts)
  end,
}

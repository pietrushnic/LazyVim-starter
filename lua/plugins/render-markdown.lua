return {
  "MeanderingProgrammer/render-markdown.nvim",
  config = function()
    require("render-markdown").setup({
      heading = {
        -- Turn on / off heading icon & background rendering
        enabled = false,
      },
      html = {
        -- Turn on / off all HTML rendering
        enabled = true,
        -- Additional modes to render HTML
        render_modes = false,
        comment = {
          -- Turn on / off HTML comment concealing
          conceal = false,
          -- Optional text to inline before the concealed comment
          text = nil,
          -- Highlight for the inlined text
          highlight = "RenderMarkdownHtmlComment",
        },
      },
    })
  end,
}

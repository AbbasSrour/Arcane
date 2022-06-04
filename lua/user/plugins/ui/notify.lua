local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup({
  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },

  stages = "fade_in_slide_out", -- Animation style (see below for details)
  on_open = nil, -- Function called when a new window is opened, use for changing win settings/config
  on_close = nil, -- Function called when a window is closed
  render = "default", -- Render function for notifications. See notify-render()
  timeout = 5000, -- Default timeout for notifications
  max_width = 100, -- Max number of columns for messages
  max_height = nil, -- Max number of lines for a message
  minimum_width = 50, -- Minimum width for notification windows
  -- background_colour = "#000000", -- For stages that change opacity this is treated as the highlight behind the window
})

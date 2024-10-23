local M = {}

M.misc = {
  Bug = " ",
  Stacks = " ",
  Scopes = "",
  Watches = "",
  DebugConsole = " ",
  mainIcon = "", --"",
  Comment = "",
  symbolsOutline = "",
  linux = "🐧", -- ""
  windows = "",
  apple = "",
  prompt = "", -- ➤
  telescope = "",
  treesitter = "",
  vim_mode = "",
  vim_pos = "",
  test = "",
  docs = "",
  clock = " ",
  Circle = "",
  calendar = " ",
  buffer = " ",
  settings = " ",
  question = "",
  screen = "冷",
  dart = " ",
  config = "", -- 
  magic = " ",
  quit = " ",
  diagnostic = " ",
  finder = " ",
  definition = "  ",
  ChevronRight = ">", -- ""
  Robot = "ﮧ",
  Squirrel = "",
  Tag = "",
  Watch = "",
  Smiley = "ﲃ",
  Package = "",
  CircuitBoard = "",
  seperator = {
    triangle = {
      right = "",
    },
    circle = {
      left = "",
    },
  },
}

M.git = {
  branch = "",
  unstaged = "",
  staged = "",
  unmerged = "",
  renamed = "➜",
  untracked = "",
  ignored = "◌",
  added = "",
  modified = "柳",
  removed = "", --""
  github = "",
}

M.lsp = {
  error = "",
  warn = "",
  info = "", -- 
  hint = "", -- 
  debug = "",
  trace = "✎",
  code_action = "💡", -- 
  inactive = "轢",
  active = "歷",
  signature = "🐼",
  virtual = "🦉", --●
}

M.nvim_tree_icons = {
  default = "",
  symlink = "",
  explorer = "פּ",
  read_only = "",
  not_saved = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
    arrow_closed = "",
    arrow_open = "",
  },
}

M.symbols_outline = {
  Text = "",
  File = "",
  Module = "",
  Namespace = "",
  Package = "",
  Class = "",
  Method = "ƒ",
  Property = "ﰠ",
  Field = "",
  Constructor = "",
  Enum = "練",
  Interface = "",
  Function = "",
  Variable = "",
  Constant = "",
  String = "𝓐",
  Number = "#",
  Boolean = "⊨",
  Array = "",
  Object ="" ,--"⦿",
  Key = "",
  Null = "NULL",
  EnumMember = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  Reference = "",
  Folder = "",
}

M.todo_comments = {
  FIX = "律",
  TODO = " ",
  HACK = " ",
  WARN = "裂",
  PERF = "龍",
  NOTE = " ",
  ERROR = " ",
  REFS = "",
}

M.numbers = {
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
  " ",
}

M.file_icons = {
  Brown = { "" },
  Aqua = { "" },
  LightBlue = { "", "" },
  Blue = { "", "", "", "", "", "", "", "", "", "", "", "", "" },
  DarkBlue = { "", "" },
  Purple = { "", "", "", "", "" },
  Red = { "", "", "", "", "", "" },
  Beige = { "", "", "" },
  Yellow = { "", "", "λ", "", "" },
  Orange = { "", "" },
  DarkOrange = { "", "", "", "", "" },
  Pink = { "", "" },
  Salmon = { "" },
  Green = { "", "", "", "", "", "" },
  LightGreen = { "", "", "", "﵂" },
  White = { "", "", "", "", "", "" },
}

return M

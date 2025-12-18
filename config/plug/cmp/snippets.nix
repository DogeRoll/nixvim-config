{ self, ... }:
{
  plugins = {
    friendly-snippets = {
      enable = true;
    };

    luasnip = {
      enable = true;
      settings = {
        history = true;
        delete_check_events = "TextChanged";
      };
    };
  };
}

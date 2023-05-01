defmodule Helpdesk.Account.Registry do
  use Ash.Registry, extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry(Helpdesk.Account.User)
    entry(Helpdesk.Account.Token)
  end
end

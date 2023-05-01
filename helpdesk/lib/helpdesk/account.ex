defmodule Helpdesk.Account do
  use Ash.Api

  resources do
    registry Helpdesk.Account.Registry
  end
end

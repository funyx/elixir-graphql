defmodule Helpdesk.Repo.Migrations.AddTicketsAndRepresentatives do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:ticket, primary_key: false) do
    end

    create table(:representative, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
    end

    alter table(:ticket) do
      add :id, :uuid, null: false, primary_key: true
    end

    alter table(:representative) do
      add :name, :text
    end

    alter table(:ticket) do
      add :subject, :text, null: false
      add :status, :text, null: false, default: "open"

      add :representative_id,
          references(:representative,
            column: :id,
            name: "ticket_representative_id_fkey",
            type: :uuid,
            prefix: "public"
          )
    end
  end

  def down do
    drop constraint(:ticket, "ticket_representative_id_fkey")

    alter table(:ticket) do
      remove :representative_id
      remove :status
      remove :subject
    end

    alter table(:representative) do
      remove :name
    end

    alter table(:ticket) do
      remove :id
    end

    drop table(:representative)

    drop table(:ticket)
  end
end
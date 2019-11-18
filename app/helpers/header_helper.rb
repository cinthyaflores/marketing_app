# frozen_string_literal: true

module HeaderHelper
  def header_items
    owner_header_items
  end

  def owner_header_items
    [{ title: 'Usuarios', path: users_path },
     { title: 'Clientes', path: clients_path },
     { title: 'Campañas', path: campaigns_path }]
  end
end

# frozen_string_literal: true

module HeaderHelper
  def header_items(user)
    return owner_header_items if user.owner?

    content_creator_header_items
  end

  def owner_header_items
    [{ title: 'Usuarios', path: users_path },
     { title: 'Clientes', path: clients_path },
     { title: 'Campañas', path: campaigns_path }]
  end

  def content_creator_header_items
    [{ title: 'Tareas', path: my_tasks_path },
     { title: 'Calendario', path: calendar_path }]
  end
end

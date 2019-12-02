# frozen_string_literal: true

module HeaderHelper
  def header_items(user)
    return owner_header_items if user.owner?
    return admin_header_items if user.admin?
    return rh_header_items if user.rrhh?
    return finance_header_items if user.finance?
    return client_header_items if user.client?
    return community_manager_header_items if user.community_manager?

    content_creator_header_items
  end

  def community_manager_header_items
    [{ title: 'Campañas', path: campaigns_path }]
  end

  def admin_header_items
    [{ title: 'Usuarios', path: users_path },
     { title: 'Campañas', path: campaigns_path }]
  end

  def client_header_items
    [{ title: 'Campañas', path: campaigns_path }]
  end

  def finance_header_items
    [{ title: 'Clientes', path: clients_path }]
  end

  def rh_header_items
    [{ title: 'Usuarios', path: users_path }]
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

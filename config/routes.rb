# frozen_string_literal: true

# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                         admin_clients GET    /admin/clients(.:format)                                                                 admin/clients#index
#                                       POST   /admin/clients(.:format)                                                                 admin/clients#create
#                      new_admin_client GET    /admin/clients/new(.:format)                                                             admin/clients#new
#                     edit_admin_client GET    /admin/clients/:id/edit(.:format)                                                        admin/clients#edit
#                          admin_client GET    /admin/clients/:id(.:format)                                                             admin/clients#show
#                                       PATCH  /admin/clients/:id(.:format)                                                             admin/clients#update
#                                       PUT    /admin/clients/:id(.:format)                                                             admin/clients#update
#                                       DELETE /admin/clients/:id(.:format)                                                             admin/clients#destroy
#                        admin_contacts GET    /admin/contacts(.:format)                                                                admin/contacts#index
#                                       POST   /admin/contacts(.:format)                                                                admin/contacts#create
#                     new_admin_contact GET    /admin/contacts/new(.:format)                                                            admin/contacts#new
#                    edit_admin_contact GET    /admin/contacts/:id/edit(.:format)                                                       admin/contacts#edit
#                         admin_contact GET    /admin/contacts/:id(.:format)                                                            admin/contacts#show
#                                       PATCH  /admin/contacts/:id(.:format)                                                            admin/contacts#update
#                                       PUT    /admin/contacts/:id(.:format)                                                            admin/contacts#update
#                                       DELETE /admin/contacts/:id(.:format)                                                            admin/contacts#destroy
#                       admin_companies GET    /admin/companies(.:format)                                                               admin/companies#index
#                         admin_company GET    /admin/companies/:id(.:format)                                                           admin/companies#show
#                    admin_corporations GET    /admin/corporations(.:format)                                                            admin/corporations#index
#                                       POST   /admin/corporations(.:format)                                                            admin/corporations#create
#                 new_admin_corporation GET    /admin/corporations/new(.:format)                                                        admin/corporations#new
#                edit_admin_corporation GET    /admin/corporations/:id/edit(.:format)                                                   admin/corporations#edit
#                     admin_corporation GET    /admin/corporations/:id(.:format)                                                        admin/corporations#show
#                                       PATCH  /admin/corporations/:id(.:format)                                                        admin/corporations#update
#                                       PUT    /admin/corporations/:id(.:format)                                                        admin/corporations#update
#                                       DELETE /admin/corporations/:id(.:format)                                                        admin/corporations#destroy
#                        admin_campains GET    /admin/campains(.:format)                                                                admin/campains#index
#                                       POST   /admin/campains(.:format)                                                                admin/campains#create
#                     new_admin_campain GET    /admin/campains/new(.:format)                                                            admin/campains#new
#                    edit_admin_campain GET    /admin/campains/:id/edit(.:format)                                                       admin/campains#edit
#                         admin_campain GET    /admin/campains/:id(.:format)                                                            admin/campains#show
#                                       PATCH  /admin/campains/:id(.:format)                                                            admin/campains#update
#                                       PUT    /admin/campains/:id(.:format)                                                            admin/campains#update
#                           admin_users GET    /admin/users(.:format)                                                                   admin/users#index
#                                       POST   /admin/users(.:format)                                                                   admin/users#create
#                        new_admin_user GET    /admin/users/new(.:format)                                                               admin/users#new
#                            admin_user GET    /admin/users/:id(.:format)                                                               admin/users#show
#                                       PATCH  /admin/users/:id(.:format)                                                               admin/users#update
#                                       PUT    /admin/users/:id(.:format)                                                               admin/users#update
#                                       DELETE /admin/users/:id(.:format)                                                               admin/users#destroy
#                            admin_root GET    /admin(.:format)                                                                         admin/campains#index
#                            rrhh_users GET    /rrhh/users(.:format)                                                                    rrhh/users#index
#                                       POST   /rrhh/users(.:format)                                                                    rrhh/users#create
#                         new_rrhh_user GET    /rrhh/users/new(.:format)                                                                rrhh/users#new
#                        edit_rrhh_user GET    /rrhh/users/:id/edit(.:format)                                                           rrhh/users#edit
#                             rrhh_user GET    /rrhh/users/:id(.:format)                                                                rrhh/users#show
#                                       PATCH  /rrhh/users/:id(.:format)                                                                rrhh/users#update
#                                       PUT    /rrhh/users/:id(.:format)                                                                rrhh/users#update
#                             rrhh_root GET    /rrhh(.:format)                                                                          rrhh/users#index
#                     finance_companies GET    /finance/companies(.:format)                                                             finance/companies#index
#                                       POST   /finance/companies(.:format)                                                             finance/companies#create
#                   new_finance_company GET    /finance/companies/new(.:format)                                                         finance/companies#new
#                  edit_finance_company GET    /finance/companies/:id/edit(.:format)                                                    finance/companies#edit
#                       finance_company GET    /finance/companies/:id(.:format)                                                         finance/companies#show
#                                       PATCH  /finance/companies/:id(.:format)                                                         finance/companies#update
#                                       PUT    /finance/companies/:id(.:format)                                                         finance/companies#update
#                  finance_corporations GET    /finance/corporations(.:format)                                                          finance/corporations#index
#                                       POST   /finance/corporations(.:format)                                                          finance/corporations#create
#               new_finance_corporation GET    /finance/corporations/new(.:format)                                                      finance/corporations#new
#              edit_finance_corporation GET    /finance/corporations/:id/edit(.:format)                                                 finance/corporations#edit
#                   finance_corporation GET    /finance/corporations/:id(.:format)                                                      finance/corporations#show
#                                       PATCH  /finance/corporations/:id(.:format)                                                      finance/corporations#update
#                                       PUT    /finance/corporations/:id(.:format)                                                      finance/corporations#update
#                          finance_root GET    /finance(.:format)                                                                       finance/companies#index
#               community_campain_nodes POST   /community/campains/:campain_id/nodes(.:format)                                          community/nodes#create
#                community_campain_node PATCH  /community/campains/:campain_id/nodes/:id(.:format)                                      community/nodes#update
#                                       PUT    /community/campains/:campain_id/nodes/:id(.:format)                                      community/nodes#update
#                                       DELETE /community/campains/:campain_id/nodes/:id(.:format)                                      community/nodes#destroy
#           community_campain_coworkers GET    /community/campains/:campain_id/coworkers(.:format)                                      community/coworkers#index
#                                       POST   /community/campains/:campain_id/coworkers(.:format)                                      community/coworkers#create
#        new_community_campain_coworker GET    /community/campains/:campain_id/coworkers/new(.:format)                                  community/coworkers#new
#       edit_community_campain_coworker GET    /community/campains/:campain_id/coworkers/:id/edit(.:format)                             community/coworkers#edit
#            community_campain_coworker GET    /community/campains/:campain_id/coworkers/:id(.:format)                                  community/coworkers#show
#                                       PATCH  /community/campains/:campain_id/coworkers/:id(.:format)                                  community/coworkers#update
#                                       PUT    /community/campains/:campain_id/coworkers/:id(.:format)                                  community/coworkers#update
#                                       DELETE /community/campains/:campain_id/coworkers/:id(.:format)                                  community/coworkers#destroy
#       community_campain_network_index GET    /community/campains/:campain_id/network(.:format)                                        community/network#index
#                                       POST   /community/campains/:campain_id/network(.:format)                                        community/network#create
#         new_community_campain_network GET    /community/campains/:campain_id/network/new(.:format)                                    community/network#new
#        edit_community_campain_network GET    /community/campains/:campain_id/network/:id/edit(.:format)                               community/network#edit
#             community_campain_network GET    /community/campains/:campain_id/network/:id(.:format)                                    community/network#show
#                                       PATCH  /community/campains/:campain_id/network/:id(.:format)                                    community/network#update
#                                       PUT    /community/campains/:campain_id/network/:id(.:format)                                    community/network#update
#                                       DELETE /community/campains/:campain_id/network/:id(.:format)                                    community/network#destroy
#                    community_campains GET    /community/campains(.:format)                                                            community/campains#index
#                     community_campain GET    /community/campains/:id(.:format)                                                        community/campains#show
#                  community_node_posts POST   /community/nodes/:node_id/posts(.:format)                                                community/posts#create
#               new_community_node_post GET    /community/nodes/:node_id/posts/new(.:format)                                            community/posts#new
#              edit_community_node_post GET    /community/nodes/:node_id/posts/:id/edit(.:format)                                       community/posts#edit
#                   community_node_post PATCH  /community/nodes/:node_id/posts/:id(.:format)                                            community/posts#update
#                                       PUT    /community/nodes/:node_id/posts/:id(.:format)                                            community/posts#update
#                       community_nodes GET    /community/nodes(.:format)                                                               community/nodes#index
#                       community_edges POST   /community/edges(.:format)                                                               community/edges#create
#                        community_edge PATCH  /community/edges/:id(.:format)                                                           community/edges#update
#                                       PUT    /community/edges/:id(.:format)                                                           community/edges#update
#                                       DELETE /community/edges/:id(.:format)                                                           community/edges#destroy
#                        community_root GET    /community(.:format)                                                                     community/campains#index
#                      new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                     new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                       PUT    /users/password(.:format)                                                                devise/passwords#update
#                                       POST   /users/password(.:format)                                                                devise/passwords#create
#                accept_user_invitation GET    /users/invitation/accept(.:format)                                                       devise/invitations#edit
#                remove_user_invitation GET    /users/invitation/remove(.:format)                                                       devise/invitations#destroy
#                   new_user_invitation GET    /users/invitation/new(.:format)                                                          devise/invitations#new
#                       user_invitation PATCH  /users/invitation(.:format)                                                              devise/invitations#update
#                                       PUT    /users/invitation(.:format)                                                              devise/invitations#update
#                                       POST   /users/invitation(.:format)                                                              devise/invitations#create
#                                  root GET    /                                                                                        landing_page#index
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  namespace :admin do
    resources :clients
    resources :contacts
    resources :companies, only: %i[index show]
    resources :corporations
    resources :campains, except: %i[destroy]
    resources :users, except: %i[edit]
    root to: 'campains#index'
  end

  namespace :rrhh do
    resources :users, except: %i[destroy]
    root to: 'users#index'
  end

  namespace :finance do
    resources :companies, except: %i[destroy]
    resources :corporations, except: %i[destroy]
    root to: 'companies#index'
  end

  namespace :community do
    resources :campains, only: %i[index show] do
      resources :nodes, only: %i[create destroy update]
      resources :coworkers
      resources :network
    end
    resources :nodes, only: %i[index] do
      resources :posts, only: %i[new edit update create]
    end
    resources :edges, only: %i[create update destroy]
    root to: 'campains#index'
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
end

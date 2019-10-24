# frozen_string_literal: true

# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                               clients GET    /clients(.:format)                                                                       clients#index
#                                       POST   /clients(.:format)                                                                       clients#create
#                            new_client GET    /clients/new(.:format)                                                                   clients#new
#                           edit_client GET    /clients/:id/edit(.:format)                                                              clients#edit
#                                client GET    /clients/:id(.:format)                                                                   clients#show
#                                       PATCH  /clients/:id(.:format)                                                                   clients#update
#                                       PUT    /clients/:id(.:format)                                                                   clients#update
#                                       DELETE /clients/:id(.:format)                                                                   clients#destroy
#                              contacts GET    /contacts(.:format)                                                                      contacts#index
#                                       POST   /contacts(.:format)                                                                      contacts#create
#                           new_contact GET    /contacts/new(.:format)                                                                  contacts#new
#                          edit_contact GET    /contacts/:id/edit(.:format)                                                             contacts#edit
#                               contact GET    /contacts/:id(.:format)                                                                  contacts#show
#                                       PATCH  /contacts/:id(.:format)                                                                  contacts#update
#                                       PUT    /contacts/:id(.:format)                                                                  contacts#update
#                                       DELETE /contacts/:id(.:format)                                                                  contacts#destroy
#                             companies GET    /companies(.:format)                                                                     companies#index
#                                       POST   /companies(.:format)                                                                     companies#create
#                           new_company GET    /companies/new(.:format)                                                                 companies#new
#                          edit_company GET    /companies/:id/edit(.:format)                                                            companies#edit
#                               company GET    /companies/:id(.:format)                                                                 companies#show
#                                       PATCH  /companies/:id(.:format)                                                                 companies#update
#                                       PUT    /companies/:id(.:format)                                                                 companies#update
#                                       DELETE /companies/:id(.:format)                                                                 companies#destroy
#                          corporations GET    /corporations(.:format)                                                                  corporations#index
#                                       POST   /corporations(.:format)                                                                  corporations#create
#                       new_corporation GET    /corporations/new(.:format)                                                              corporations#new
#                      edit_corporation GET    /corporations/:id/edit(.:format)                                                         corporations#edit
#                           corporation GET    /corporations/:id(.:format)                                                              corporations#show
#                                       PATCH  /corporations/:id(.:format)                                                              corporations#update
#                                       PUT    /corporations/:id(.:format)                                                              corporations#update
#                                       DELETE /corporations/:id(.:format)                                                              corporations#destroy
#                              campains GET    /campains(.:format)                                                                      campains#index
#                                       POST   /campains(.:format)                                                                      campains#create
#                           new_campain GET    /campains/new(.:format)                                                                  campains#new
#                          edit_campain GET    /campains/:id/edit(.:format)                                                             campains#edit
#                               campain GET    /campains/:id(.:format)                                                                  campains#show
#                                       PATCH  /campains/:id(.:format)                                                                  campains#update
#                                       PUT    /campains/:id(.:format)                                                                  campains#update
#                                       DELETE /campains/:id(.:format)                                                                  campains#destroy
#                                 users GET    /users(.:format)                                                                         users#index
#                                       POST   /users(.:format)                                                                         users#create
#                              new_user GET    /users/new(.:format)                                                                     users#new
#                             edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                                  user GET    /users/:id(.:format)                                                                     users#show
#                                       PATCH  /users/:id(.:format)                                                                     users#update
#                                       PUT    /users/:id(.:format)                                                                     users#update
#                                       DELETE /users/:id(.:format)                                                                     users#destroy
#                                       GET    /corporations(.:format)                                                                  corporations#index
#                                       POST   /corporations(.:format)                                                                  corporations#create
#                                       GET    /corporations/new(.:format)                                                              corporations#new
#                                       GET    /corporations/:id/edit(.:format)                                                         corporations#edit
#                                       GET    /corporations/:id(.:format)                                                              corporations#show
#                                       PATCH  /corporations/:id(.:format)                                                              corporations#update
#                                       PUT    /corporations/:id(.:format)                                                              corporations#update
#                                       DELETE /corporations/:id(.:format)                                                              corporations#destroy
#                         campain_nodes POST   /campains/:campain_id/nodes(.:format)                                                    nodes#create
#                          campain_node PATCH  /campains/:campain_id/nodes/:id(.:format)                                                nodes#update
#                                       PUT    /campains/:campain_id/nodes/:id(.:format)                                                nodes#update
#                                       DELETE /campains/:campain_id/nodes/:id(.:format)                                                nodes#destroy
#                     campain_coworkers GET    /campains/:campain_id/coworkers(.:format)                                                coworkers#index
#                                       POST   /campains/:campain_id/coworkers(.:format)                                                coworkers#create
#                  new_campain_coworker GET    /campains/:campain_id/coworkers/new(.:format)                                            coworkers#new
#                 edit_campain_coworker GET    /campains/:campain_id/coworkers/:id/edit(.:format)                                       coworkers#edit
#                      campain_coworker GET    /campains/:campain_id/coworkers/:id(.:format)                                            coworkers#show
#                                       PATCH  /campains/:campain_id/coworkers/:id(.:format)                                            coworkers#update
#                                       PUT    /campains/:campain_id/coworkers/:id(.:format)                                            coworkers#update
#                                       DELETE /campains/:campain_id/coworkers/:id(.:format)                                            coworkers#destroy
#                 campain_network_index GET    /campains/:campain_id/network(.:format)                                                  network#index
#                                       POST   /campains/:campain_id/network(.:format)                                                  network#create
#                   new_campain_network GET    /campains/:campain_id/network/new(.:format)                                              network#new
#                  edit_campain_network GET    /campains/:campain_id/network/:id/edit(.:format)                                         network#edit
#                       campain_network GET    /campains/:campain_id/network/:id(.:format)                                              network#show
#                                       PATCH  /campains/:campain_id/network/:id(.:format)                                              network#update
#                                       PUT    /campains/:campain_id/network/:id(.:format)                                              network#update
#                                       DELETE /campains/:campain_id/network/:id(.:format)                                              network#destroy
#                                       GET    /campains(.:format)                                                                      campains#index
#                                       GET    /campains/:id(.:format)                                                                  campains#show
#                            node_posts POST   /nodes/:node_id/posts(.:format)                                                          posts#create
#                         new_node_post GET    /nodes/:node_id/posts/new(.:format)                                                      posts#new
#                        edit_node_post GET    /nodes/:node_id/posts/:id/edit(.:format)                                                 posts#edit
#                             node_post PATCH  /nodes/:node_id/posts/:id(.:format)                                                      posts#update
#                                       PUT    /nodes/:node_id/posts/:id(.:format)                                                      posts#update
#                                 nodes GET    /nodes(.:format)                                                                         nodes#index
#                                 edges POST   /edges(.:format)                                                                         edges#create
#                                  edge PATCH  /edges/:id(.:format)                                                                     edges#update
#                                       PUT    /edges/:id(.:format)                                                                     edges#update
#                                       DELETE /edges/:id(.:format)                                                                     edges#destroy
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
  resources :clients
  resources :contacts
  resources :companies
  resources :corporations
  resources :campains
  resources :users
  resources :corporations

  resources :campains, only: %i[index show] do
    resources :nodes, only: %i[create destroy update]
    resources :coworkers
    resources :network
  end

  resources :nodes, only: %i[index] do
    resources :posts, only: %i[new edit update create]
  end
  resources :edges, only: %i[create update destroy]

  devise_for :users, controllers: { registrations: 'registrations' }
  root 'landing_page#index'
end

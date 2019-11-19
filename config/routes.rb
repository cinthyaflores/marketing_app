# frozen_string_literal: true

# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
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
#                             campaigns GET    /campaigns(.:format)                                                                     campaigns#index
#                                       POST   /campaigns(.:format)                                                                     campaigns#create
#                          new_campaign GET    /campaigns/new(.:format)                                                                 campaigns#new
#                         edit_campaign GET    /campaigns/:id/edit(.:format)                                                            campaigns#edit
#                              campaign GET    /campaigns/:id(.:format)                                                                 campaigns#show
#                                       PATCH  /campaigns/:id(.:format)                                                                 campaigns#update
#                                       PUT    /campaigns/:id(.:format)                                                                 campaigns#update
#                                       DELETE /campaigns/:id(.:format)                                                                 campaigns#destroy
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
#                    campaign_coworkers GET    /campaigns/:campaign_id/coworkers(.:format)                                              coworkers#index
#                                       POST   /campaigns/:campaign_id/coworkers(.:format)                                              coworkers#create
#                 new_campaign_coworker GET    /campaigns/:campaign_id/coworkers/new(.:format)                                          coworkers#new
#                edit_campaign_coworker GET    /campaigns/:campaign_id/coworkers/:id/edit(.:format)                                     coworkers#edit
#                     campaign_coworker GET    /campaigns/:campaign_id/coworkers/:id(.:format)                                          coworkers#show
#                                       PATCH  /campaigns/:campaign_id/coworkers/:id(.:format)                                          coworkers#update
#                                       PUT    /campaigns/:campaign_id/coworkers/:id(.:format)                                          coworkers#update
#                                       DELETE /campaigns/:campaign_id/coworkers/:id(.:format)                                          coworkers#destroy
#                                       GET    /campaigns(.:format)                                                                     campaigns#index
#                                       GET    /campaigns/:id(.:format)                                                                 campaigns#show
#                         network_edges GET    /network/:network_id/edges(.:format)                                                     edges#index
#                                       POST   /network/:network_id/edges(.:format)                                                     edges#create
#                      new_network_edge GET    /network/:network_id/edges/new(.:format)                                                 edges#new
#                     edit_network_edge GET    /network/:network_id/edges/:id/edit(.:format)                                            edges#edit
#                          network_edge GET    /network/:network_id/edges/:id(.:format)                                                 edges#show
#                                       PATCH  /network/:network_id/edges/:id(.:format)                                                 edges#update
#                                       PUT    /network/:network_id/edges/:id(.:format)                                                 edges#update
#                                       DELETE /network/:network_id/edges/:id(.:format)                                                 edges#destroy
#                         network_nodes GET    /network/:network_id/nodes(.:format)                                                     nodes#index
#                                       POST   /network/:network_id/nodes(.:format)                                                     nodes#create
#                      new_network_node GET    /network/:network_id/nodes/new(.:format)                                                 nodes#new
#                     edit_network_node GET    /network/:network_id/nodes/:id/edit(.:format)                                            nodes#edit
#                          network_node GET    /network/:network_id/nodes/:id(.:format)                                                 nodes#show
#                                       PATCH  /network/:network_id/nodes/:id(.:format)                                                 nodes#update
#                                       PUT    /network/:network_id/nodes/:id(.:format)                                                 nodes#update
#                                       DELETE /network/:network_id/nodes/:id(.:format)                                                 nodes#destroy
#                               network GET    /network/:id(.:format)                                                                   network#show
#                                 posts POST   /posts(.:format)                                                                         posts#create
#                             edit_post GET    /posts/:id/edit(.:format)                                                                posts#edit
#                                  post GET    /posts/:id(.:format)                                                                     posts#show
#                                       PATCH  /posts/:id(.:format)                                                                     posts#update
#                                       PUT    /posts/:id(.:format)                                                                     posts#update
#                                       DELETE /posts/:id(.:format)                                                                     posts#destroy
#                        campaign_posts GET    /campaigns/:campaign_id/posts(.:format)                                                  posts#index
#                     new_campaign_post GET    /campaigns/:campaign_id/posts/new(.:format)                                              posts#new
#                                       GET    /campaigns(.:format)                                                                     campaigns#index
#                                 edges POST   /edges(.:format)                                                                         edges#create
#                                  edge PATCH  /edges/:id(.:format)                                                                     edges#update
#                                       PUT    /edges/:id(.:format)                                                                     edges#update
#                                       DELETE /edges/:id(.:format)                                                                     edges#destroy
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
  devise_for :users

  resources :clients
  resources :contacts
  resources :companies
  resources :corporations
  resources :campaigns
  resources :users
  resources :corporations

  resources :campaigns, only: %i[index show] do
    resources :coworkers
  end

  resources :network, only: :show do
    resources :edges
    resources :nodes
  end

  resources :posts, except: %i[index new]

  resources :campaigns, only: %i[index] do
    resources :posts, only: %i[index new]
  end
  resources :edges, only: %i[create update destroy]

  root 'landing_page#index'
end

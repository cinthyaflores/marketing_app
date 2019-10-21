# frozen_string_literal: true

devio = Company.create_or_find_by!(name: 'Dev.io',
                                   legal_representant_name: 'Jaime González',
                                   legal_representant_email: 'jaimeg@gmail.com',
                                   legal_representant_phone: '312-320-3873',
                                   legal_representant_role: 'CEO',
                                   bussines_name: 'DEVIO INCORPORATIONS',
                                   rfc: 'DSFR4312MNKD987LM',
                                   location: 'Avenida V. Carranza 233')

User.create_or_find_by!(email: 'dueno_agencia@gmail.com',
                        password: 'password',
                        roles_mask: 1,
                        company: devio)

community_manager = User.create_or_find_by!(email: 'community_manager@gmail.com',
                                            password: 'password',
                                            roles_mask: 4,
                                            company: devio)

designer = User.create_or_find_by!(email: 'disenador@gmail.com',
                                   password: 'password',
                                   roles_mask: 16,
                                   company: devio)

content_creator = User.create_or_find_by!(email: 'generador_contenidos@gmail.com',
                                          password: 'password',
                                          roles_mask: 8,
                                          company: devio)

User.create_or_find_by!(email: 'rh@gmail.com',
                        password: 'password',
                        roles_mask: 32,
                        company: devio)

User.create_or_find_by!(email: 'finance@gmail.com',
                        password: 'password',
                        roles_mask: 64,
                        company: devio)

tennis_campaign = Campain.create_or_find_by!(name: 'Tennis Max Air',
                                             start_date: Time.now,
                                             end_date: Time.now + 1.week,
                                             objective: 'Promocionar neuvo producto',
                                             campain_type: 1,
                                             product: 'Tenis Max Air',
                                             manager: community_manager,
                                             company: devio,
                                             image: Rack::Test::UploadedFile.new('test/fixtures/files/example.jpg', 'image/jpg'))

Coworker.create_or_find_by!(user: content_creator,
                            campain: tennis_campaign,
                            role: 1)

Coworker.create_or_find_by!(user: designer,
                            campain: tennis_campaign,
                            role: 2)
Coworker.create_or_find_by!(user: content_creator,
                            campain: tennis_campaign,
                            role: 1)
Coworker.create_or_find_by!(user: content_creator,
                            campain: tennis_campaign,
                            role: 1)
Coworker.create_or_find_by!(user: content_creator,
                            campain: tennis_campaign,
                            role: 1)

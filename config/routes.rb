Rails.application.routes.draw do

  # Necessary for the pagination in will_paginate
  scope path: Railspress.posts_permalink_prefix do
    get 'page/:page' => 'railspress/home#posts'
    get 'tag/:slug/page/:page' => 'railspress/archive#taxonomy', defaults: { taxonomy: 'post_tag' }
    get 'author/:slug/page/:page' => 'railspress/archive#author', defaults: { taxonomy: 'author' }, as: :authors_posts
    get ':taxonomy/:slug/page/:page' => 'railspress/archive#taxonomy'
  end

  scope :admin do
    resources :options, controller: 'railspress/options', as: :admin_options
  end

  get 'test' => 'railspress/home#testing_page'

  # get '*slug' => 'railspress/posts#singular', as: :show_page

  mount Railspress::Engine => '/'

  # scope :news do
  #   # get ':slug' => 'railspress/posts#singular'
  #   get 'tag/:slug' => 'railspress/archive#taxonomy', defaults: {taxonomy: 'post_tag'}
  #   get ':taxonomy/:slug' => 'railspress/archive#taxonomy'
  # end

  root 'railspress/home#index'

end

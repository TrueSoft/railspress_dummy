Rails.application.routes.draw do

  scope :admin do
    resources :options, controller: 'railspress/options' , as: :admin_options
  end

    get 'test' => 'railspress/home#testing_page'

  # get '*slug' => 'railspress/posts#single', as: :show_page

  mount Railspress::Engine => '/'

  # scope :news do
  #   # get ':slug' => 'railspress/posts#single'
  #   get 'tag/:slug' => 'railspress/archive#taxonomy', defaults: {taxonomy: 'post_tag'}
  #   get ':taxonomy/:slug' => 'railspress/archive#taxonomy'
  # end

  root 'railspress/home#index'

end

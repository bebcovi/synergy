Synergy::Engine.routes.draw do
  scope "(:locale)", locale: /en|hr/ do
    resources :projects, only: :show

    controller :errors do
      match ":code", to: :show, constraints: {code: /\d+/},
        via: [:get, :post, :put, :patch, :delete]
    end
  end
end

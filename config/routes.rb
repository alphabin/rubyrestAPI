Rails.application.routes.draw do
  get  '/users/:id/goodbye' => 'users#goodbye', as: 'goodbye'
  get  '/users/signin'      => 'users#signin' , as: 'signin'  # request blank signin form
  post '/users/visit'       => 'users#visit' ,  as: 'visit'    # submit the form
  get  '/users/:name'       => 'users#visit'                  # sign in using URL
  get  '/api/*url' => 'iframeapi#visit_iframe', :constraints => {:url => /.*/} , as: 'urlSearch'
  root  'users#signin'         #home page
end
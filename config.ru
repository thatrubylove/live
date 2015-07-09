require 'rack/router'
use Rack::Static,
  :urls => ["/images", "/javascripts", "/stylesheets"],
  :root => "public"

home = ->(env) {
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}

watch = ->(env) {
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/watch.html', File::RDONLY)
  ]
}

router = Rack::Router.new do
  get "/" => home
  get "/watch" => watch
end

run router

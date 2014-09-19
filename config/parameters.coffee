app_path = './app'
assets_path = app_path + '/assets'


config =

  assets: assets_path
  dist: './dist'
  dist_css: './dist/css'

  templates_folder: assets_path + '/templates/'
  stylesheets_folder: assets_path + '/stylesheets/main.styl'
  js_folder: assets_path + '/js/*.js'

module.exports = config
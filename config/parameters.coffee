app_path = 'app'
assets_path = app_path + '/assets'


config =

  app_path: app_path
  web_path: 'public'
  vendor_path: 'vendor'
  assets_path: assets_path

  # Mine
  templates_folder: assets_path + '/templates'
  stylesheets_folder: assets_path + '/stylesheets'
  js_folder: assets_path + '/js'

  app_main_file: 'app.js'
  css_main_file: 'app.css'
  styles_main_file: app_path + '/app.less' # or app.sass if you prefer Sass
  templates_file: 'app.templates.js'
  templates_module: 'myapp'
  vendor_main_file: 'vendor.js'
  bower_main_file: 'bower-vendor.js'
  manifest_file: 'myapp.appcache'

module.exports = config
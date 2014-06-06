# lineman-rails

Install this module if you plan on using rails-lineman to deploy Lineman assets
inside a Rails application.

To install to your lineman app, cd into your project directory and run:

```
npm i --save-dev lineman-rails
```

No further configuration is required.

## What does this module do?

The `rails-lineman` gem deals with the production asset deployment such that running
`rake assets:precompile` will do a clean lineman build of your lineman app, and then
put them on an asset path so your assets get precompiled/fingerprinted by the asset
pipeline.

What this `lineman-rails` npm module does is provide lineman plugin behavior to make
the *development* story easier while working in conjunction with rails.

By default it:

* Sets up API proxying for the server to localhost:3000 for development
* Mounts static routes so that Rails `asset_path` helpers in development can be provided
the same string in both dev & prod while you just happily hack away inside `app/js` and
`app/css` without worrying about it.
* disables the pages task entirely since you'll probably want to use a Rails view,
even in development

If you want to add additional staticRoutes (say, for fonts or images), you can do
that by adding properties to the `server.staticRoutes` config object.

## Configuration

Configuration options exposed by this plugin must be overridden in your `config/application` file,
like so:

```
  plugins:
    rails:
      namespace: "my-app"
```

The "namespace" property enables support for [rails-lineman's multi-project option](https://github.com/linemanjs/rails-lineman#pointing-at-multiple-lineman-projects),
so your ERB can start looking for your app assets in `<%= javascript_include_tag "lineman/my-app/app" %>`

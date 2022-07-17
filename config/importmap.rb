# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js", preload: true
pin "select2", to: "https://ga.jspm.io/npm:select2@4.1.0-rc.0/dist/js/select2.js"
pin "cocoon", to: "https://ga.jspm.io/npm:cocoon@0.1.1/lib/index.js"
pin "cocoon-js-vanilla", to: "https://ga.jspm.io/npm:cocoon-js-vanilla@1.2.0/index.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.5/lib/index.js"

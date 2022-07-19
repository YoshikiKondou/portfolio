import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "cocoon"
import "cocoon-js-vanilla";
import "select2";

$( "js-searchable" ).select2({
  theme: "bootstrap",
  width: 200,
  allowClear: true
});

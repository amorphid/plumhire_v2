function bootswatchHead(){
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-23019901-1']);
  _gaq.push(['_setDomainName', "bootswatch.com"]);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
}

// autosize
$(document).ready(function(){
  $("textarea").autosize();
});

// form validations

$(document).ready(function(){
  $("form").submit(validateForm);
});

function validateForm(e){
  if (
    $(this).parsley().validate() === false
  )
    e.preventDefault();
}

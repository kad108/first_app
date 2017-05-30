var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
};

$(document).on('turbolinks:load ajaxSuccess', function(){

  refreshRating();

   $('.img-zoom').elevateZoom({
   	zoomType: "lens", lensShape: "round", lensSize: 300
   });

   $('.alert').delay(50).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });

});